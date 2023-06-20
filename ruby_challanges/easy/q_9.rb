=begin
Problem:
Write a program that can generate the lyrics of the 99 Bottles of Beer song.
See the test suite for the entire song.

P:
Input: integer
output: string

return the verse of the 99 beer song based on the input integer
the input integer represents the verse number
input can be a range of integers so the output is all the verses in that range
the whole song can also be output

E:
based on the provided example suite a class BeerSong is required
and want need to define three methods

verse (class method)
it accepts one integer input
return the verse according to the verse number


verses (class method)
it accepts two integer input
returns the verses from the first till the second verse number

lyrics (class method)
returns the all the verses

D:
integer
string

A:

Method: `verse` (class method)
save the input in local variable bottles

if bottles is 0
  return the verse 0
if bottles is 1
  return the verse 1
if bottle is 2
  return the verse 2
if bottle is greater than 2
  return the verse with the input value interpolated in the string

Method: `verses (class method)
save the two integer input in first and last local variable respectively
initialize local variable str to empty string

iterate over range (first..last)
  add the string for the current verse in str
return str

Method: `lyrics` (class method)
outputs all the verses from 99 till 0
=end

class BeerSong

  def self.verse(bottles)
    case bottles
    when 0
      zero_verse
    when 1
      one_verse
    when 2
      two_verse
    else
      default_verse(bottles)
    end
  end

  def self.verses(first, second)
    str = ''
    (second..first).to_a.reverse.each do |num|
       str += verse(num)
       str += "\n" if num != second
    end
    str
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def zero_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    def one_verse
      "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def two_verse
      "2 bottles of beer on the wall, 2 bottles of beer.\n" +
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def default_verse(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" +
      "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
    end
  end
end
