# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map(&block)
      return enum_for(:map) unless block_given?

      a = []
      0.upto(size - 1) do |el|
        a.push block.call(self[el])
      end
      a
    end

    def my_select(&block)
      return enum_for(:select) unless block_given?

      a = []
      size.times do |el|
        a.push self[el] if block.call(self[el])
      end
      a
    end

    def my_each
      return enum_for(:each) unless block_given?

      size.times do |el|
        yield self[el]
      end
      self
    end
  end
end
