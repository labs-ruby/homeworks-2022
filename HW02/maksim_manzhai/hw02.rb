# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return to_enum unless block_given?
      return [] if empty?

      temp_array = []
      for item in self
        temp_array << yield(item)
      end
      temp_array
    end

    def my_select
      return to_enum unless block_given?
      return [] if empty?

      temp_array = []
      for item in self
        temp_array << item if yield(item)
      end
      temp_array
    end

    def my_each
      return to_enum unless block_given?
      return [] if empty?

      for item in self
        yield(item)
      end
    end
  end
end
