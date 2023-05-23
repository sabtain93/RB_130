def echo(str)
  str
end


# p echo
# this raises an error as the method is expecting an argument

p echo("hello")
# the above line outputs the string "hello"

p echo("hello") { puts "world" }
# the above line also outputs the string "hello"

# p echo { puts "World"}
#error is raised wromg number of arguments

#line 12 does not raise an error.But how do we know that the block was passed into the method
# How can we make sure the method actually have access to the block.
