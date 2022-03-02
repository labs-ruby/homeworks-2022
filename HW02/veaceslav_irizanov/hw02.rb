#!/usr/bin/env ruby
# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_each
      return to_enum(:each) unless block_given?

      num = 0
      while num < size
        yield self[num]
        num += 1
      end
      self
    end

    def my_map(&block)
      return to_enum(:map) unless block_given?

      result = []
      my_each do |element|
        result << block.call(element)
      end
      result
    end

    def my_select(&block)
      return to_enum(:select) unless block_given?

      result = []
      my_each do |element|
        result << element if block.call(element)
      end
      result
    end
  end
end
