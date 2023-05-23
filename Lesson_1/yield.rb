# one way we can invoke the passed in block argument from within the method is by using the 
# yield keyword

def echo(str)
  yield
  str
end

p echo('Hello') { puts "world" } # "world"
                                # "Hello"

# Now calling the method with one argument and a block raises no error
# The string `world` is output and then the method return value is outputted
# that is the string `Hello'

# this tells us two things
# First: that the number of arguments passed to the method needs to match the method definition
# even if a block is begin passed to it or not

# second: The yield keyword executes the block.

# p echo('Hello') # this raises the error `localjump` error
# as the method implementation has `yield` but no block is begin passed to the method

# now the solution to this is to wrap the `yield` in a conditional so no error is raised if no block
# is passed in
# this can be acheived by using the `Kernel#block_given?` method

