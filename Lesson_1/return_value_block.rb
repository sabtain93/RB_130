def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

compare("Hello") { |str| str.upcase }

# In the above code we are using the return value of the block and initializing the method local variable
# `after` to it
# blocks behave similarly to methods in the way that they can be passed arguments and block either
# return a value or can call a destructive method and mutate the value passed to the block.