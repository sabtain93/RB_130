=begin
- initialize a counter local variable to 0
- iterate over the array input
  - yeiled the block and pass to it the current element
  - if the return value is true
    - increment the counter
  - check counter value if 2
    - stop iterating return false
- check if counter is 1
  - return true
- if 0
  - return false
=end
def one?(arr)
  counter = 0
  arr.each do |elem|
    counter += 1 if yield(elem)
    return false if counter == 2
  end

  return true if counter == 1
  false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false