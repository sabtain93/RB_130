=begin
Write a method called any? that behaves similarly for Arrays.
It should take an Array as an argument, and a block.
It should return true if the block returns true for any of the element values.
Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, any? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

P:
input : Array and a block
output: true or false
rules:
return true if argument passed the block returns true and stop processing
return false if the block does not return true for any of the arguments passed to the block
return false if the argument passed is empty

E:
input: 1, 3, 5, 6
first pass 1 to block -> block returns false as it is not even
same for 3 and 5 as above
6 is the last arguemnt passed and block returns true so the the output is true

input: []
argument is empty so regardless of the block the method returns false

Data structure:
Arrays
Integers

Algo:
- scrapped - if array passed in is empty return false
 - iterate over the array passed as argument
 - for each element yield the block
 - if the return value is true
  - return true
 - if not
  - check next
 - return false
=end

def any?(arr)

  arr.each do |elem|
    return true if yield(elem)
  end

  false
end


p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false