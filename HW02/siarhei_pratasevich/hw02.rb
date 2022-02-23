# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      result = []
      size.times do |index|
        result.push(yield(self[index]))
      end
      result
    end

    def my_select
      result = []
      size.times do |index|
        result.push(self[index]) if yield(self[index])
      end
      result
    end

    def my_each
      size.times do |index|
        yield(self[index])
      end
      self
    end
  end
end
