=begin

p:
input: arr
output: nil

E:
[1, 3, 6, 10]  hash[value1] = value2


D
arrays

algo:
- iterate over the array with index
  - initialize index to current index
  - if index is the last index
    then break the iteration
  - else
    - call the block and pass in the current element and the element on the index + 1
- return nil


=end
def each_cons(arr)
  arr.each_with_index do |elem, idx|
    break if idx + 1 >= arr.size
    yield(elem, arr[idx + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil