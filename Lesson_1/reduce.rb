=begin
- define the method with two parameter
- the second parameter is set to 0
  - initialize a counter to 0
  - yield the block (pass in the first element of the array and the second argument)
  - assign the return value of the block to value local variable
  - increment counter by 1
  - iterate over the array argumnet till the size of the array - 1
    - yield the block (pass in the current element and value)
    - update value to the return value of the block
    - increment the counter by 1
  - return value

=end

def reduce(array, acc = array[0])
  if acc == array[0]
    counter = 1
  else
    counter = 0
  end
  value = acc
  while counter < array.size
    value = yield(value, array[counter])
    counter += 1
  end

  value
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']