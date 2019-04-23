module Nite
  class ChapterPool < Nite::Pool
    has_many :pool_members, foreign_key: 'pool_id'

    # has many thorough via a polymorphic table
    has_many :chapters, through: :pool_members, 
      source: :membership, source_type: 'Chapter'

    def find_candidates(used)
      self.chapters - excluded_elements(used)
    end

    # def select(used)
    #   candidates = self.chapters - excluded_elements(used)
    #   candidates[rand(candidates.size)]
    # end
    #
  end
end
