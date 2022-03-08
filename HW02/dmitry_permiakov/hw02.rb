# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return to_enum unless block_given?

      total = []
      for i in self
        total << yield(i)
      end
      total
    end

    def my_select
      return to_enum unless block_given?

      total = []
      for i in self
        total << i if yield(i)
      end
      total
    end

    def my_each
      return to_enum unless block_given?

      for i in self
        yield(i)
      end
    end
  end
end
