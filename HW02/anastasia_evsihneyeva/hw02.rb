module MyArrayMethods
    refine Array do
        def my_map(&block)
            new_arr = []
            for i in self
                if block_given?
                    new_arr << block.call(i)
                end
            end
            new_arr
        end

        def my_select(&block)
            new_arr = []
            for i in self
                if block_given? and block.call(i) 
                        new_arr << i
                end
            end
            new_arr
        end

        def my_each(&block)
            for i in self
                if block_given?  
                    yield i
                end
            end
        end
    end
end

#using MyArrayMethods


