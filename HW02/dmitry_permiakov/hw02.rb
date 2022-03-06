# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return to_enum unless block_given?

      total = []
      for i in self
        total << i
      end
      total
    end

    def my_select
      return to_enum unless block_given?

      total = []
      for i in self
        total << i if i
      end
      total
    end

    def my_each
      return to_enum unless block_given?

      for i in self
        yield i
      end
      self
    end
  end
end
