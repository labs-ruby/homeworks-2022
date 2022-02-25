# frozen_string_literal: true

module MyArrayMethods
  refine Array do
<<<<<<< HEAD
<<<<<<< HEAD
    def my_map(&block)
<<<<<<< HEAD
<<<<<<< HEAD
      return nil if block.nil?
=======
=======
>>>>>>> fix HW2
    def my_map
      return enum_for(:map) unless block_given?
>>>>>>> modified HW02 specs

<<<<<<< HEAD
=======
      return nil if block == nil
>>>>>>> fixed nil bug in HW02
=======
      return nil if block.nil?

>>>>>>> fixed rubocop style in modified HW02
      reduce([]) { |result, array_element| result.push(yield(array_element)) }
    end

<<<<<<< HEAD
    def my_select(&block)
<<<<<<< HEAD
<<<<<<< HEAD
      return nil if block.nil?

=======
      return nil if block == nil
>>>>>>> fixed nil bug in HW02
=======
      return nil if block.nil?
=======
=======
      reduce([]) { |result, array_element| result.push(yield(array_element)) }
    end

>>>>>>> fix HW2
    def my_select
      return enum_for(:select) unless block_given?
>>>>>>> modified HW02 specs

<<<<<<< HEAD
>>>>>>> fixed rubocop style in modified HW02
=======
>>>>>>> fix HW2
      reduce([]) { |result, array_element| yield(array_element) ? result.push(array_element) : result }
    end

<<<<<<< HEAD
    def my_each(&block)
<<<<<<< HEAD
<<<<<<< HEAD
      return nil if block.nil?

=======
      return nil if block == nil
>>>>>>> fixed nil bug in HW02
=======
      return nil if block.nil?
=======
    def my_each
      return enum_for(:each) unless block_given?
>>>>>>> modified HW02 specs

>>>>>>> fixed rubocop style in modified HW02
      size.times do |index|
        yield(self[index])
      end
      self
    end
  end
end