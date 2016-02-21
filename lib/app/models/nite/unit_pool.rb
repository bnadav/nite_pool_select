module Nite
  class UnitPool < Nite::Pool
    has_many :pool_members, foreign_key: 'pool_id'

    # has many thorough via a polymorphic table
    has_many :units, through: :pool_members, 
      source: :membership, source_type: 'Unit'

  end
end
