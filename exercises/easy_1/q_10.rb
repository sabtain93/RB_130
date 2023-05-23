=begin

algo:
initialize a counter to 0
iterate over the input array
yield the block and pass in the current element
if return value of the block is true
  - incremnent the counter

return the counter

=end

def count(arr)
  counter = 0

  arr.each do |elem|
    counter += 1 if yield(elem)
  end
  counter
end


p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2