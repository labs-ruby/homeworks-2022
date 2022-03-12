# frozen_string_literal: true

# Array#my_map, Array#my_select, Array#my_each
module MyArrayMethods
  refine Array do
    def my_each
      return to_enum unless block_given?

      i = 0
      while i < size
        yield self[i]
        i += 1
      end
<<<<<<< HEAD:HW02/andrei_godes/hw02.rb
      self
=======
      clone
>>>>>>> parent of a9a336c... fix methods for tests:HW02/shkuryn/hw02.rb
    end

    def my_map
      return to_enum unless block_given?

      my_map = []
      my_each do |value|
        my_map << yield(value)
      end
<<<<<<< HEAD:HW02/andrei_godes/hw02.rb
      my_map
    end

    def my_select
      return to_enum unless block_given?
=======
      clone
    end

    def my_each
      return unless block_given?
>>>>>>> parent of a9a336c... fix methods for tests:HW02/shkuryn/hw02.rb

      my_select = []
      my_each do |value|
        my_select << value if yield(value)
      end
<<<<<<< HEAD:HW02/andrei_godes/hw02.rb
      my_select
=======
>>>>>>> parent of a9a336c... fix methods for tests:HW02/shkuryn/hw02.rb
    end
  end
end
