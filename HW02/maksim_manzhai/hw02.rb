module MyArrayMethods
  refine Array do
    def my_map; end

    def my_select; end

    def my_each(&block)
      if block_given?
        if block
          self
        else
          []
        end
      else
        nil
      end
    end
  end
end
