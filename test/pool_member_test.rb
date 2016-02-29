require 'test_helper'

class Nite::PoolMemberTest < ActiveSupport::TestCase
  setup do
    @chapter_pool = Nite::ChapterPool.create(name: "chapter_pool")
    @unit_pool = Nite::UnitPool.create(name: "unit_pool")
    @item_pool = Nite::ItemPool.create(name: "item_pool")

    @chapter = Chapter.create(number: 1)
    @unit = Unit.create(number: 1)
    @item = Item.create(number: 1)
  end

  test "No chapters in empty chapter pool" do
    assert  @chapter_pool.chapters = []
  end

  # test "Associations not included when configured so" do
  #   Nite::PoolSelect.config.chapters_pool = false
  #   assert_not_includes(Chapter.included_modules, Nite::ModelPools)
  # end

  test "Adding a chapter to chapte pool, is saved away" do
    @chapter_pool.chapters << @chapter
    assert @chapter_pool.chapters.size == 1
    assert @chapter_pool.chapters.first == @chapter
  end

  test "Adding a unit to units pool, is saved away" do
    @unit_pool.units << @unit
    assert @unit_pool.units.size == 1
    assert @unit_pool.units.first == @unit
  end

  test "Adding an item to items pool, is saved away" do
    @item_pool.items << @item
    assert @item_pool.items.size == 1
    assert @item_pool.items.first == @item
  end

  test "Chapter can list it's pools" do
    @chapter_pool.chapters << @chapter
    assert @chapter.chapter_pools.size == 1
    assert_includes @chapter.chapter_pools, @chapter_pool
  end



  # In future version add the same capability also to Unit and Item models
end
