# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return to_enum unless block_given?

      map_result = []
      for index in self
        map_result << yield(index)
      end
      map_result
    end

    def my_select
      return to_enum unless block_given?

      select_result = []
      for index in self
        select_result << index if yield(index)
      end
      select_result
    end

    def my_each
      return to_enum unless block_given?

      for index in self
        yield(index)
      end
    end
  end
end
