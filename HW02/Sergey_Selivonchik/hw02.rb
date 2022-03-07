# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      if block_given?
        mapped_array = []
        length.times do |i|
          mapped_array.push(yield self[i])
        end
        mapped_array
      else
        to_enum
      end
    end

    def my_select
      if block_given?
        mapped_array = []
        length.times do |i|
          mapped_array.push self[i] if yield self[i]
        end
        mapped_array
      else
        to_enum
      end
    end

    def my_each
      if block_given?
        length.times do |i|
          yield self[i]
        end
        self
      else
        to_enum
      end
    end
  end
end
