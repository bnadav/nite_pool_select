class Chapter < ActiveRecord::Base
  # Add to gem as inserted class method calls ?
  has_many :pool_members, :as => :membership, class_name: 'Nite::PoolMember'
  has_many :chapter_pools, through: :pool_members,
    class_name: 'Nite::ChapterPool', source: 'pool'
end
