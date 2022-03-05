# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      if block_given?
        size.times { |i| self[i] = yield(self[i]) }
        self
      else
        to_enum
      end
    end

    def my_select
      if block_given?
        a = []
        size.times { |i| a << self[i] if yield(self[i]) }
        a
      else
        to_enum
      end
    end

    def my_each
      if block_given?
        size.times { |i| yield(self[i]) }
        self
      else
        to_enum
      end
    end
  end
end
