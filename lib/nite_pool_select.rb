require 'generators/nite_pool_select/install_generator'
require 'app/models/nite/pool'
require 'app/models/nite/chapter_pool'
require 'app/models/nite/unit_pool'
require 'app/models/nite/item_pool'
require 'app/models/nite/pool_member'


module Nite
  # for activer record use
  def self.table_name_prefix
    'nite_'
  end

  module PoolSelect
  end
end
