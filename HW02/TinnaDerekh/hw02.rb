module MyArrayMethods
  refine Array do
    def my_map 
      if block_given?
        result = []
        i = 0  
        for i in self
          result << yield(i)
        end
        result
      else
        to_enum
      end
    end

    def my_select
      if block_given?
        result = []
        i = 0
        for i in self
          result << self[i] if yield self[i]
        end
        result
      else
        to_enum
      end
    end

    def my_each
      if block_given?
        for i in self
          yield(i)
        end
      else
        to_enum
      end
    end
  end
end
