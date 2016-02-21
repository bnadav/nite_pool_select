module Nite
  class Pool < ActiveRecord::Base

    def select(used_elements, check_dependency=true)
      excluded = []
      if check_dependency
        excluded = used_elements.inject([]) {|m, elem| m += elem.dependencies.map(&:id); m}.flatten
      end
      candidates = self.pool_members - excluded
      candidates[rand(candidates.size)]
    end

  end
end
