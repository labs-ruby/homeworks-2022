# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map(&block)
<<<<<<< HEAD
      return nil if block.nil?

=======
      return nil if block == nil
>>>>>>> fixed nil bug in HW02
      reduce([]) { |result, array_element| result.push(yield(array_element)) }
    end

    def my_select(&block)
<<<<<<< HEAD
      return nil if block.nil?

=======
      return nil if block == nil
>>>>>>> fixed nil bug in HW02
      reduce([]) { |result, array_element| yield(array_element) ? result.push(array_element) : result }
    end

    def my_each(&block)
<<<<<<< HEAD
      return nil if block.nil?

=======
      return nil if block == nil
>>>>>>> fixed nil bug in HW02
      size.times do |index|
        yield(self[index])
      end
      self
    end
  end
end