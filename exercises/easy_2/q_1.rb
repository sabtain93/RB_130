=begin
input: integers

=end

def step(start, ending, step)

  value = start

  loop do
    yield(value)
    break if value + step > ending
    value += step
  end
end


step(1, 10, 3) { |value| puts "value = #{value}" }