# def drop_while(arr)
#   result = []
#   starting_idx = nil
#   arr.each_with_index do |elem, idx|
#     if !yield(elem)
#       break starting_idx = idx
#     end
#   end

#   if starting_idx
#     (starting_idx..(arr.size - 1)).each { |idx| result << arr[idx] }
#   end
#   result
# end

def drop_while(arr)
  index = 0

  while index < arr.size && yield(arr[index])
    index += 1
  end

  arr[index..-1]
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []