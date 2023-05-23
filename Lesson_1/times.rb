def times(num)
  counter = 0

  while counter < num
    yield(counter)
    counter += 1
  end

  counter
end

times(5) do |num|
  puts num
end