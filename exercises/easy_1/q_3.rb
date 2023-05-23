=begin
  - initialize result local variable to empty array
  - initialize local variable arr to the array passed
  - iterate from the value at 0 index in arr till the value at the last index
    - for current value check if it is in arr
    - add the current value in result if it is not included in arr
  - return result
=end

def missing(arr)
  result = []

  (arr[0]..arr[-1]).each do |num|
    result << num if !arr.include?(num)
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []