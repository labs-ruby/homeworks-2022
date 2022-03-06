# frozen_string_literal: true

# Array#my_map, Array#my_select, Array#my_each
module MyArrayMethods
  refine Array do
    def my_each
      return to_enum unless block_given?

      i = 0
      while i < size
        yield self[i]
        i += 1
      end
      self
    end

    def my_map
      return to_enum unless block_given?

      my_map = []
      my_each do |value|
        my_map << yield(value)
      end
      my_map
    end

    def my_select
      return to_enum unless block_given?

      my_select = []
      my_each do |value|
        my_select << value if yield(value)
      end
      my_select
    end
  end
end
