# frozen_string_literal: true

module MyArrayMethods
  refine Array do
    def my_map; end

    def my_select; end

    def my_each
      return nil unless block_given?

      if empty?
        []
      else
        for item in self
          yield item
        end
      end
    end
  end
end
