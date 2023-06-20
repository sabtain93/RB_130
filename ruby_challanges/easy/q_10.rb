=begin
Write a program that will take a string of digits and return all
the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string,
you should throw an error.

P:
input: numbered string
output: 2d integer array

given a string of digits and a lenght
return all consecutive lengths possible
raise an error if the string length is less than the length asked

E:
From the example suite provided a class `Series` is required with
two methods

constructor:
It accpts one string argument

slices:
it accpts one integer argument
it raises error is length of string is less than input integer

D:
2d array
string

Algo:

constructor:
- save the input string for later use

Method: slices
store the input integer in len local variable
raises error if input string length is less than the integer input

initialize result array to empty array

split the string into characters
convert the characters into integer and store them in an array
 iterate over the array track iteration using index
  break if length of current index to last index is less than the len
  slice the array from the current index for length of len
  store in result array

return trhe result array
=end

class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(len)
    raise ArgumentError, "wrong length of arguemnt" unless valid?(len)

    result = []

    arr = str.chars.map(&:to_i)

    arr.each_index do |idx|
      break if arr[idx..-1].size < len

      result << arr[idx, len]
    end

    result
  end

  private

  def valid?(len)
    str.length >= len
  end
end
