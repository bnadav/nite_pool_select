module Nite
  class Pool < ActiveRecord::Base

    validates_uniqueness_of :parent_id,  {scope: :type, allow_nil: true}

    attr_writer :placeholder

    before_validation do
      self.parent_id = @placeholder.id if @placeholder
    end

    # Exclude used elements and also dependent elements on those included
    # in used_elements array, IF the nite_dependency gem is installed
    def excluded_elements(used_elements)
      excluded = used_elements
      if exclude_dependent?
        excluded += used_elements.inject([]) {|m, elem| m += elem.dependencies; m}.flatten
      end
      excluded
    end

    def select(used, &block)
      candidates = find_candidates(used) # In subclasses
      if block_given?
        yield(candidates)
      else
        candidates[rand(candidates.size)]
      end
    end

    protected

    def exclude_dependent?
      defined? Nite::Dependency
    end

  end
end
