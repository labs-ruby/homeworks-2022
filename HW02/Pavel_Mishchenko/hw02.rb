# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      if block_given?
        result = []
        for i in 0...length
          result << yield(self[i])
        end
        result
      else
        to_enum(:map)
      end
    end

    def my_select
      if block_given?
        result = []
        for i in 0...length
          result << self[i] if yield self[i]
        end
        result
      else
        to_enum(:select)
      end
    end

    def my_each
      if block_given?
        result = []
        for i in 0...length
          yield(self[i])
          result << self[i]
        end
        result
      else
        to_enum(:each)
      end
    end
  end
end
