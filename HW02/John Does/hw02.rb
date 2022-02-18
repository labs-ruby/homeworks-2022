# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return unless block_given?

      result_array = []
      for i in 0...length
        result_array << yield(self[i])
      end
      result_array
    end

    def my_select
      return unless block_given?

      result_array = []
      for i in 0...length
        result_array << self[i] if yield(self[i])
      end
      result_array
    end

    def my_each
      return unless block_given?

      for i in 0...length
        yield(self[i])
      end
      self
    end
  end
end
