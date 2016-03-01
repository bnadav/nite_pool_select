module Nite
  module ModelPools
    extend ActiveSupport::Concern
    include ActiveSupport::Inflector 

    included do
      has_many :pool_members, :as => :membership, class_name: 'Nite::PoolMember'
      has_many "#{name.underscore}_pools".to_sym, through: :pool_members, class_name: "Nite::#{name}Pool", source: 'pool'
    end

    def pool_placeholder?
      (self.name =~ /POOL_SELECT/) != nil 
    end


  end

  # A configuration module. Configuration can be changed via
  # the config/initializers/nite_pool_select.rb file
  # For each model marked, the Nite::ModelPools module is mixed in.
  module PoolSelect
    module Configure
      # config options
      defaults = Struct.new(:chapters_pool, :units_pool, :items_pool)
      # default values (for matching option)
      @config = defaults.new(true, true, true)

      # override the defaluts by calling the block with the config object
      # The method is invoked in initializer
      def self.run &block
        if block_given?
          block.call(@config) 
        end
      end

      def self.config
        @config
      end

    end
  end

  # Mixin ModelPools module into model if so configured
  # and recall the missing method after the inclusion of the mixin
  module MethodMissinHandler
    include ActiveSupport::Inflector 
    def method_missing(method_name, *arguments, &block)
      if(method_name == :pool_placeholder? || method_name == :pool_members || method_name.to_s =~ /^.*_pools?/) &&
        (mixin_model_pools(method_name, *arguments, &block))
        self.send method_name, *arguments, &block
      else
        super
      end
    end

    private
    # mixin the Nite::ModelPools module into self's class, if 
    # Nite::PoolSelect::Config.config object marks it as poolable. i.e if config
    # config.chapter_pool = true, and also self is an instance of Chapter, then perform the mixin.
    # Otherwise return nil
    def mixin_model_pools(method_name, *arguments, &block)
      pool_name = "#{self.class.to_s.tableize}_pool".to_sym
      if Nite::PoolSelect::Configure.config.try(pool_name)
        self.class.send :include, Nite::ModelPools
      end
    end
  end
end

ActiveRecord::Base.send :include, Nite::MethodMissinHandler

