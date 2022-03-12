# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map(&block)
      result_array = []
      if block_given?
        for elem in self
          result_array << block.call(elem)
        end
        result_array
      else
        to_enum
      end
    end

    def my_select(&block)
      result_array = []
      if block_given?
        for elem in self
          result_array << elem if block.call(elem)
        end
        result_array
      else
        to_enum
      end
    end

    def my_each
      if block_given?
        for elem in self
          yield(elem)
        end
      else
        to_enum
      end
    end
  end
end
