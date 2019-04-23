module Nite
  class UnitPool < Nite::Pool
    has_many :pool_members, foreign_key: 'pool_id'

    # has many thorough via a polymorphic table
    has_many :units, through: :pool_members, 
      source: :membership, source_type: 'Unit'

    def find_candidates(used)
      self.units - excluded_elements(used)
    end

    # def select(used, &block)
    #   candidates = self.units - excluded_elements(used)
    #   if block_given?
    #     yield(candidates)
    #   else
    #     candidates[rand(candidates.size)]
    #   end
    # end
  end
end
