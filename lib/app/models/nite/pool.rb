module Nite
  class Pool < ActiveRecord::Base

    validates :parent_id, uniqueness: {scope: :type}

    def excluded_elements(used_elements)
      excluded = used_elements
      if exclude_dependent?
        excluded += used_elements.inject([]) {|m, elem| m += elem.dependencies; m}.flatten
      end
      excluded
    end

    protected

    def exclude_dependent?
      defined? Nite::Dependency
    end

  end
end
