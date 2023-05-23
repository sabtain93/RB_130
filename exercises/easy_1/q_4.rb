=begin
  initailze result to an empty array
  initialize number to the argument passed in
  iterate from 1 till number (inclusive)
    if the number is completely divisible by current number
      - add the current number in the result array
  return result array

=end

def divisors(number)
  result = []

  (1..number).each do |num|
    if number % num == 0
      result << num
    end
  end

  result
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute