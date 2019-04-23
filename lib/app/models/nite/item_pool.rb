module Nite
  class ItemPool < Nite::Pool
    has_many :pool_members, foreign_key: 'pool_id'

    # has many thorough via a polymorphic table
    has_many :items, through: :pool_members, 
      source: :membership, source_type: 'Item'

    def find_candidates(used)
      self.items - excluded_elements(used)
    end

    # def select(used)
    #   candidates = self.items - excluded_elements(used)
    #   candidates[rand(candidates.size)]
    # end

  end
end
