=begin
P:
input : array
output: integer or array

rules:
return the value from input array for which the block returns the maximum value
empty array return nil

E:
[1, 5, 3]  {value + 2}
1+2 = 3
5+2 = 7-> 5 will be returned
3+2 = 5

[[1, 2], [3, 4, 5], [6]]  {value.size }
[1, 2].size = 2
[3, 4, 5].size = 3 -> [3, 4, 5] is the return value
[6].size = 1

Data:
array

Algo:
- create a local variable result initialized to nil
- create a local variable index initilaized to 0
- iterate through the array
  - yield the block
  - assign the return value of the block to current value
  - if result is nil
    reassign result to current value
    go on to next iteration
  -if not nil
    - check if current value is greater than the result value
      - reassign result to current value
      - get the index of current value and assign it to index
  -if not 
    - go on to next iteration

  return element of the input array at index
=end


def max_by(arr)
  result = nil
  index = 0
  arr.each_with_index do |elem, idx|
    current = yield(elem)
    if !result
      result = current
    else
      if current > result
        result = current
        index = idx
      end
    end
  end

  arr[index]

end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil