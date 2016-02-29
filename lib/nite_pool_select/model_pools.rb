module Nite
  module ModelPools
    extend ActiveSupport::Concern
    include ActiveSupport::Inflector 

    included do
      has_many :pool_members, :as => :membership, class_name: 'Nite::PoolMember'
      has_many "#{name.underscore}_pools".to_sym, through: :pool_members, class_name: "Nite::#{name}Pool", source: 'pool'


      define_method(:pool_placeholder?) { (self.name =~ /POOL_SELECT/) != nil }
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
        mixin_pools_into_models
      end

      # Do the actual definition of models and mix in the Nite::ModelPools module into them.
      def self.mixin_pools_into_models
        models_list = []
        models_list << "Chapter" if @config.chapters_pool
        models_list << "Unit" if @config.units_pool
        models_list << "Item" if @config.items_pool

        models_list.each do |model|
          unless Object.const_defined? model
            Object.const_set model, Class.new(ActiveRecord::Base) 
          end
          model.constantize.send :include, Nite::ModelPools
        end
      end

      # def self.config
      #   @config
      # end

    end
  end
end
