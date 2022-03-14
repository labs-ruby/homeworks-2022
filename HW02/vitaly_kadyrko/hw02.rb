# frozen_string_literal: true

# app/models/user.rb
module MyArrayMethods
  refine Array do
    def my_select
      result_array = []
      if block_given?
        size.times do |i|
          result_array << self[i] if yield(self[i])
        end
        result_array
      else
        enum_for
      end
    end

    def my_map
      result_array = []
      if block_given?
        size.times do |i|
          result_array << yield(self[i])
        end
        result_array
      else
        enum_for
      end
    end

    def my_each
      if block_given?
        size.times do |i|
          yield(self[i])
        end
        self
      else
        enum_for
      end
    end
  end
end
