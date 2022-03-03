# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map(&block)
      new_arr = []
      return to_enum unless block_given?

      for i in self
        new_arr << block.call(i)
      end
      new_arr
    end

    def my_select(&block)
      new_arr = []
      return to_enum unless block_given?

      for i in self
        new_arr << i if block.call(i)
      end
      new_arr
    end

    def my_each
      if block_given?
        for i in self
          yield i
        end
      else
        to_enum
      end
    end
  end
end
