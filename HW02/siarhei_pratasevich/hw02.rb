# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      reduce([]) { |result, array_element| result.push(yield(array_element)) }
    end

    def my_select
      reduce([]) { |result, array_element| yield(array_element) ? result.push(array_element) : result }
    end

    def my_each
      size.times do |index|
        yield(self[index])
      end
      self
    end
  end
end
