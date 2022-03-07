# frozen_string_literal: true

# this is module MyArrayMethods
module MyArrayMethods
  refine Array do
    def my_each
      return to_enum(:each) unless block_given?

      size.times { |i| yield(self[i]) }
      self
    end

    def my_map
      return to_enum(:map) unless block_given?

      res_arr = []
      size.times do |i|
        res_arr << yield(self[i])
      end
      res_arr
    end

    def my_select
      return to_enum(:select) unless block_given?

      res_arr = []
      size.times do |i|
        res_arr << self[i] if yield(self[i])
      end
      res_arr
    end
  end
end
