module Nite
  class PoolMember < ActiveRecord::Base
    belongs_to :pool
    belongs_to :membership, polymorphic: true

  end
end
