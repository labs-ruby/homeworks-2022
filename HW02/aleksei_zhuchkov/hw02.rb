# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return each unless block_given?

      return [] if empty?

      result = []
      for item in self
        middle_result = yield item
        result << middle_result
      end
      result
    end

    def my_select
      return each unless block_given?

      return [] if empty?

      result = []
      for item in self
        boolean_value = yield item
        result << item if boolean_value
      end
      result
    end

    def my_each
      return each unless block_given?

      return [] if empty?

      for item in self
        yield item
      end
      self
    end
  end
end
