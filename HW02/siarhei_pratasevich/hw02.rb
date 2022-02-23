# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
<<<<<<< HEAD
<<<<<<< HEAD
      return enum_for(:map) unless block_given?

=======
>>>>>>> HW02 modifed refine Array red method
      reduce([]) { |result, array_element| result.push(yield(array_element)) }
    end

    def my_select
<<<<<<< HEAD
      return enum_for(:select) unless block_given?

=======
>>>>>>> HW02 modifed refine Array red method
      reduce([]) { |result, array_element| yield(array_element) ? result.push(array_element) : result }
    end

    def my_each
      return enum_for(:each) unless block_given?

=======
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
>>>>>>> Homework02 refine Array my_map, my_select, my_each
      size.times do |index|
        yield(self[index])
      end
      self
    end
  end
end
