# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return to_enum unless block_given?

      result = []
      size.times do |iteration|
        result << yield(self[iteration])
      end
      result
    end

    def my_select
      return to_enum unless block_given?

      result = []
      size.times do |iteration|
        result << self[iteration] if yield(self[iteration])
      end
      result
    end

    def my_each
      return to_enum unless block_given?

      size.times do |iteration|
        yield(self[iteration])
      end
      self
    end
  end
end
