# frozen_string_literal: true

# implementation of map, select, each.
module MyArrayMethods
  refine Array do
    def my_map
      return to_enum :my_map unless block_given?

      res = []
      each do |value|
        res << (yield value)
      end
      res
    end

    def my_select
      return to_enum :my_select unless block_given?

      res = []
      each do |value|
        res << value if yield value
      end
      res
    end

    def my_each(&block)
      return to_enum :my_each unless block_given?

      each(&block)
    end
  end
end
