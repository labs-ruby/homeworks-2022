# frozen_string_literal: true

module MyArrayMethods
     refine Array do
         def my_map
         return to_enum unless block_given?
         total = []
         for i in self {total << i}
         return total
         
         def my_select
         return to_enum unless block_given?
         
         end
         def my_each
         return to_enum unless block_given?
         
         
         end
     end
 end
