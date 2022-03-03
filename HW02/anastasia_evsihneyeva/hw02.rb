# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map(&block)
      new_arr = []
      for i in self
        new_arr << block.call(i) if block_given?
      end
      new_arr.to_enum
    end

    def my_select(&block)
      new_arr = []
      for i in self
        new_arr << i if block_given? && block.call(i)
      end
      new_arr.to_enum
    end

    def my_each
      for i in self
        yield i if block_given?
      end
    end
  end
end
