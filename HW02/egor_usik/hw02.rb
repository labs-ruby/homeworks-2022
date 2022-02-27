#!/usr/bin/ruby

module MyArrayMethods
  refine Array do
    def my_map
      return "No block given" unless block_given?
      
      result = []
      for element in self do
        result << yield(element)
      end

      result
    end

    def my_select
      return "No block given" unless block_given?

      result = []
      for element in self do
        result << element if yield(element)
      end

      result
    end
    
    def my_each
      return "No block given" unless block_given?

      for element in self do
        yield(element)
      end
    end
  end
end

using MyArrayMethods

p [1, 2.0, "bar"].my_map { |el| el * 2 }
p [1, 2, 5].my_select { |el| not el.even? }
[1, 2, 5].my_each { |el| print el, ' - ' }