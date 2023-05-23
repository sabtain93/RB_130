def say_hello
  "Hello"
end

# p say_hello
# rasies an error, as the method expects no arguments and we are passing in one

p say_hello
# outputs the string "Hello"

p say_hello { puts "World" }
# still outputs "hello". but this time no error raised. As methods in Ruby
# take blocks as an implicit arguments

