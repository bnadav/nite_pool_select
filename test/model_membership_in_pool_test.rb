class ModelMembershipInPool < ActiveSupport::TestCase

  test "Chapter has many chapter_pool" do
    c = Chapter.create(number: 11)

   assert c.chapter_pools == []

  end

end
