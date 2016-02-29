require 'test_helper'
# require 'minitest/spec'
require 'minitest/autorun'

class PoolFinderTest < ActiveSupport::TestCase

  describe "Nite::PoolSelect.pool_by_parent" do

    before do
      @c_dummy = Chapter.create(number: 99)
      @chapter_pool = Nite::ChapterPool.create(name: "cpool", parent_id: @c_dummy.id)
    end

    after do
      Chapter.delete_all
      Nite::ChapterPool.delete_all
    end

    it "should find chapter pool by parent" do
      Nite::PoolSelect.pool_by_parent(@c_dummy).must_equal @chapter_pool 
    end

    it "should raise exception if parnet class id not Chapte, Unit or Item" do
      proc {Nite::PoolSelect.pool_by_parent(@chapter_pool)}.must_raise
    end

    it "returns nil if parent is not associated with a pool" do
      Nite::PoolSelect.pool_by_parent(Chapter.new(id: (@c_dummy.id + 1))).must_be_nil
    end
  end
end
