# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return 'No block given' unless block_given?

      result = []
      for element in self do
        result << yield(element)
      end

      result
    end

    def my_select
      return 'No block given' unless block_given?

      result = []
      for element in self do
        result << element if yield(element)
      end

      result
    end

    def my_each
      return 'No block given' unless block_given?

      for element in self do
        yield(element)
      end
    end
  end
end

using MyArrayMethods

my_array = [1, nil, 2.0, 'bar']
p my_array.my_map(&:to_s)
my_array.my_select { |elem| puts elem * 2 unless elem.nil? }
my_array.my_each { |elem| print elem, '-' }
