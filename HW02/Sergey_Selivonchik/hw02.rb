# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      mapped_array = []
      length.times do |i|
        mapped_array.push yield self[i]
      end
      mapped_array
    end

    def my_select
      mapped_array = []
      length.times do |i|
        mapped_array.push self[i] if (yield self[i]) == true
      end
      mapped_array
    end

    def my_each
      mapped_array = []
      length.times do |i|
        mapped_array.push self[i]
      end
      mapped_array
    end
  end
end
