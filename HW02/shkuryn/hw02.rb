# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      if block_given?
        results = []
        i = 0
        while i < size
          results.push(yield self[i])
          i += 1
        end
        return results
      end
      clone
    end

    # my select
    def my_select
      if block_given?
        results = []
        i = 0
        while i < size
          results.push(self[i]) if yield self[i]
          i += 1
        end
        return results
      end
      clone
    end

    def my_each
      return unless block_given?

      i = 0
      while i < size
        yield(self[i])
        i += 1
      end
    end
  end
end
