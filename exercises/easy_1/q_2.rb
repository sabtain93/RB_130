# def compute
#   if block_given?
#     yield
#   else
#     'Does not compute.'
#   end
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

#further exploration

def compute(arg)
  if block_given?
    yield(arg)
  end
end

p compute(2) {|num| num + 5 } == 7
p compute("Hi") {|str| str + " World"} == "Hi World"
p compute(4) {|num| "the argument is #{num}"} == "the argument is 4"