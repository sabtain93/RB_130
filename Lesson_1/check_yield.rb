
# so now by using the `kernel#block_given` we are able to remove the `localjump` error

def echo(str)
  yield if block_given?
  str
end

p echo("Hello") { puts "World" }
p echo('Hello') # as no block is given the `block_given?` method returns `false` and so no 
# block is expected