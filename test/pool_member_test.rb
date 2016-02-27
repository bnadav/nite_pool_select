require 'test_helper'

class Nite::PoolMemberTest < ActiveSupport::TestCase
  setup do
    @pool = Nite::ChapterPool.create(name: "chapter_pool")
    @chapter = Chapter.create(number: 1)
  end

  test "No chapters in empty chapter pool" do
    assert  @pool.chapters = []
  end

  test "Adding a chapter to chapte pool, is saved away" do
    @pool.chapters << @chapter
    assert @pool.chapters.size == 1
    assert @pool.chapters.first == @chapter
  end

  # In future version add the same capability also to Unit and Item models
end
