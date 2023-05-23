def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end


increment(5) do |num|
  puts num
end

# 6 is output and 6 is returned by the method `increment`

# execution starts at line 9 the method `increment` is invoked
# execution jumps tro method implementation on line 2, the method local variable `number` is assigned to `5` which is
# passed to the method and the block passed in is an implicit argument so it is not assigned to variable
# execution moves to line 2, the `if` conditional and as block is passed to the method the condition is true
# execution move to line 3 and the block is executed and is passed the return value of local variable value
# incremented by 1 which evaluates to `6`.
# execution jumps to line 9, here the block parameter `num` is assigned to `6`
# execution continues to line 10, where we output the block local variable `num`
# execution continues to line 11, where the end of block is reached.
# execution jumps back to method implementation, where just finished executing line 3
#execution continues to line 4, the end of `if`
# execution continues to line 5 which returns the value of the incremented argument to line 9
# the program ends (the return value of the #increment is not used).

