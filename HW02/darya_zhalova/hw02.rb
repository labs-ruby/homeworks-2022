# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      if block_given?
        a = []
        length.times do |i|
          a.push(yield self[i])
        end
        a
      else
        to_enum
      end
    end

    def my_select
      if block_given?
        a = []
        length.times do |i|
          a.push self[i] if yield self[i]
        end
        a
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
