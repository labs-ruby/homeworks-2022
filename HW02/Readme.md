## HW02

- use `Ruby >= 3.0`
- create a new branch `my_hw_02`
- create a new file `HW02/<name_surname>/hw02.rb` with your implemention
- make a PR to the main repo

### The task:

- Implement your own `Array#my_map`, `Array#my_select`, `Array#my_each`.

Notes: implement these methods in your custom module using `ruby refinements`.
You module must be named as `MyArrayMethods`.

example:

```ruby
module MyArrayMethods
    refine Array do
        def my_map; end
        def my_select; end
        def my_each; end
    end
end
```

Important: Do not use #each, #select, #map in your implementation (!).
