#!/usr/bin/env ruby
# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_each
      return to_enum(:my_each) unless block_given?

      i = 0
      while i < size
        yield self[i]
        i += 1
      end
      self
    end

    def my_map(&block)
      result = []
      my_each do |element|
        result << block.call(element)
      end
      result
    end

    def my_select(&block)
      result = []
      my_each do |element|
        result << element if block.call(element)
      end
      result
    end
  end
end
