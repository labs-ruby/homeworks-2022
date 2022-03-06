# frozen_string_literal: true

# implementation of map, select, each.
module MyArrayMethods
  refine Array do
    def my_map
      return to_enum unless block_given?

      res = []
      for value in self do
        res << (yield value)
      end
      res
    end

    def my_select
      return to_enum unless block_given?

      res = []
      for value in self do
        res << value if yield value
      end
      res
    end

    def my_each
      return to_enum unless block_given?

      for i in self
        yield(i)
      end
    end
  end
end
