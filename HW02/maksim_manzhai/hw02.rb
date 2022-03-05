# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map
      return nil unless block_given?

      if empty?
        []
      else
        temp_array = []
        for item in self
          temp_array << yield(item)
        end
        temp_array
      end
    end

    def my_select
      return nil unless block_given?
    end

    def my_each
      return nil unless block_given?

      if empty?
        []
      else
        for item in self
          yield(item)
        end
      end
    end
  end
end
