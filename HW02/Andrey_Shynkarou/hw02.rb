# frozen_string_literal: true
module MyArrayMethods
  refine Array do
    def my_map
      if block_given?
        self.size.times do |i|
          self[i] = yield(self[i])
        end
        return self

      else
        return self.to_enum
      end
      
    end

    def my_select
      if block_given?
        a = []
        self.size.times do |i|
          a << self[i] if yield(self[i])
        end
        return a
      else
        return self.to_enum
      end
    end
    def my_each
      if block_given?
        self.size.times do |i|
          yield(self[i])
        end
        return self
      else
        return self.to_enum
      end
    end
  end
end