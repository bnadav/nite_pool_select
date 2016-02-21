module Nite
  class ChapterPool < Nite::Pool
    has_many :pool_members, foreign_key: 'pool_id'

    # has many thorough via a polymorphic table
    has_many :chapters, through: :pool_members, 
      source: :membership, source_type: 'Chapter'

  end
end
