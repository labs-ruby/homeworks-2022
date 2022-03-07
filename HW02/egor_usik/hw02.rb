# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return 'No block given' unless block_given?

      result = []
      compact.cycle(1) { |element| result << yield(element) }

      result
    end

    def my_select
      return 'No block given' unless block_given?

      compact.cycle(1) { |element| [] << element if yield(element) }
    end

    def my_each(&block)
      return 'No block given' unless block_given?

      compact.cycle(1, &block)
    end
  end
end

using MyArrayMethods

my_array = [1, nil, 2.0, 'bar']
p my_array.my_map(&:to_s)
my_array.my_select { |elem| puts elem * 2 }
my_array.my_each { |elem| print elem, '-' }
