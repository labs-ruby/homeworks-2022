# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      if block_given?
        results = []
        index = 0
        while index < size
          results.push(yield self[index])
          index += 1
        end
        return results
      end
      enum_for(:map)
    end

    def my_select
      if block_given?
        results = []
        index = 0
        while index < size
          results.push(self[index]) if yield self[index]
          index += 1
        end
        return results
      end
      enum_for(:select)
    end

    def my_each
      return enum_for(:each) unless block_given?

      index = 0
      while index < size
        yield(self[index])
        index += 1
      end
      self
    end
  end
end
