# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return enum_for(:map) unless block_given?

      reduce([]) { |result, array_element| result.push(yield(array_element)) }
    end

    def my_select
      return enum_for(:select) unless block_given?

      reduce([]) { |result, array_element| yield(array_element) ? result.push(array_element) : result }
    end

    def my_each
      return enum_for(:each) unless block_given?

      size.times do |index|
        yield(self[index])
      end
      self
    end
  end
end
