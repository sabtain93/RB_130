def zip(arr1, arr2)
  result = []
  idx = 0
  while idx < arr1.size
    result << [arr1[idx], arr2[idx]]
    idx += 1
  end
  result
end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]