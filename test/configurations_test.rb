require 'test_helper'

class ConfigurationsTest < ActiveSupport::TestCase

  # test "pool mixin inclusion is controlled by configurations" do
  #   Object.send :remove_const, :Unit if defined? Unit
  #   Object.send :remove_const, :Chapter if defined? Chapter
  #   Object.send :remove_const, :Item if defined? Item
  #   Nite::PoolSelect::Configure.run do |config|
  #     config.chapters_pool = true
  #     config.units_pool = false
  #     config.items_pool = true
  #   end
  #   assert_not_includes Unit.included_modules, Nite::ModelPools
  #   assert_includes Chapter.included_modules, Nite::ModelPools
  #   assert_includes Item.included_modules, Nite::ModelPools
  # end
end
