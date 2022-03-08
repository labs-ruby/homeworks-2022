# frozen_string_literal: true

# my implementation
module MyArrayMethods
  refine Array do
    def my_select
      array = []
      if block_given?
        length.times do |iteration|
          array.push(self[iteration]) if yield self[iteration]
        end
        array
      else
        enum_for
      end
    end

    def my_map
      array = []
      if block_given?
        length.times do |iteration|
          array.push(yield self[iteration])
        end
        array
      else
        enum_for
      end
    end

    def my_each
      if block_given?
        length.times do |iteration|
          yield self[iteration]
        end
        self
      else
        enum_for
      end
    end
  end
end
