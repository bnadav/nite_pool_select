module Nite
  class Pool < ActiveRecord::Base

    def excluded_elements(used_elements)
      excluded = used_elements
      if defined? Nite::Dependency
        excluded += used_elements.inject([]) {|m, elem| m += elem.dependencies.map(&:id); m}.flatten
      end
      excluded
    end

  end
end
