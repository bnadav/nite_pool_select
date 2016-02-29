require 'generators/nite_pool_select/install_generator'
require 'app/models/nite/pool'
require 'app/models/nite/chapter_pool'
require 'app/models/nite/unit_pool'
require 'app/models/nite/item_pool'
require 'app/models/nite/pool_member'
require 'nite_pool_select/model_pools'

module Nite
  # for activer record use
  def self.table_name_prefix
    'nite_'
  end

  module PoolSelect
    def self.pool_by_parent(parent)
      klass = parent.class 
      unless [Chapter, Unit, Item].include? klass
        raise "Parent must be of class Chapter, Unit or Item - got #{klass}"
      end

      pool_type = "Nite::#{klass}Pool".constantize #i.e ChaptePool, UnitPool, ItemPool
      pool_type.find_by(parent_id: parent.id)
    end
  end

end

