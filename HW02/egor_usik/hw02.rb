# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return to_enum unless block_given?

      result = []
      for element in self do
        result << yield(element)
      end

      result
    end

    def my_select
      return to_enum unless block_given?

      result = []
      for element in self do
        result << element if yield(element)
      end

      result
    end

    def my_each
      return to_enum unless block_given?

      for element in self do
        yield(element)
      end
    end
  end
end

using MyArrayMethods

my_array = [1, 2.0, 'bar']
p my_array.my_map(&:to_s)
my_array.my_select { |elem| puts elem * 2 }
my_array.my_each { |elem| puts "#{elem}-" }
