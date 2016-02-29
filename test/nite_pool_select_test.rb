require 'test_helper'
require 'minitest/autorun'

class NitePoolSelectTest < ActiveSupport::TestCase
  setup do
    @chapter_pool = Nite::ChapterPool.create(name: "chapter_pool")
    @chapter_pool.chapters << Chapter.create(number: 1)
    @chapter_pool.chapters << Chapter.create(number: 2)
    @chapter_pool.chapters << Chapter.create(number: 3)
    Chapter.create(number: 4) # out of pool
  end

  test "Without used elements, one of pool's elements is selected" do
    selected = @chapter_pool.select([])
    assert_instance_of Chapter, selected
    assert_includes @chapter_pool.chapters, selected
  end

  test "With all elements used, nothing is selected" do
    selected = @chapter_pool.select(@chapter_pool.chapters)
    assert_nil selected
  end

  test "With all but one elements used, the left element is selected" do
    used_elements = Chapter.where("number in (1,2)")
    selected = @chapter_pool.select(used_elements)
    assert selected.number == 3
  end

  test "Dependent elements are excluded" do
    # Mimick inclusion of nite's dependency gem
    @chapter_pool.stub(:exclude_dependent?, true) do
      c1 = Chapter.find_by(number: 1)
      c2 = Chapter.find_by(number: 2)
      # mimick exclusion of second chapter
      Chapter.send :define_method, :dependencies, Proc.new {[c2]} 
      # c1 is used and c2 is dependent on c1 so it is excluded
      selected = @chapter_pool.select([c1])
      # c3 is the only chapter not excluded in pool
      assert selected.number == 3
    end

  end

end
