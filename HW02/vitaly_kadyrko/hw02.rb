module MyArrayMethods
  refine Array do
    
    def my_select(&block)
      result_array = []
      if block_given?
        self.size.times do |i|
          if yield(self[i])
            result_array << self[i]
          end
        end
        return result_array
      else 
        return self.enum_for
      end  
    end

    def my_map(&block)
      result_array = []
      if block_given?
        self.size.times do |i|
          result_array << yield(self[i])
        end
        return result_array
      else
        return self.enum_for
      end
    end

    def my_select(&block)
      if block_given?
        self.size.times do |i|
          self[i] = yield(self[i])
        end
        return self
      else
        return self.enum_for
      end
    end

  end
end