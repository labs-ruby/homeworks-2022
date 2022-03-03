# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      arr = []
      if block_given?
        for i in self
          arr << yield(i)
        end
        arr
      else
        to_enum
      end
    end

    def my_select
      arr = []
      le = length
      if block_given?
        0..le.times do |i|
          arr << self[i] if yield(self[i])
        end
        arr
      else
        to_enum
      end
    end

    def my_each
      if block_given?
        for i in self
          yield(i)
        end
      else
        to_enum
      end
    end
  end
end
