module Nite
  module ModelPools
    extend ActiveSupport::Concern
    include ActiveSupport::Inflector 

    included do
      has_many :pool_members, :as => :membership, class_name: 'Nite::PoolMember'
      has_many "#{name.underscore}_pools".to_sym, through: :pool_members, class_name: "Nite::#{name}Pool", source: 'pool'
    end

  end
end

class Chapter < ActiveRecord::Base
  include Nite::ModelPools
end

# class Unit < ActiveRecord::Base
#   include Nite::ModelPools
# end
#
# class Item < ActiveRecord::Base
#   include Nite::ModelPools
# end
