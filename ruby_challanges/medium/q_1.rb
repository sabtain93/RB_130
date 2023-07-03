=begin
Problem:
The diamond exercise takes as its input a letter,
 and outputs it in a diamond shape.
Given a letter, it prints a diamond starting with 'A',
 with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.
=end
class Diamond
  def self.make_diamond(letter)

    # return "A\n" if letter == 'A'
    hash = {}
    counter = 1
    ('A'..'Z').each do |alpha|
      hash[alpha] = counter
      counter += 1
    end
    str = ""
    space = 1
    ('A'..letter).each do |alpha|
      if alpha == 'A'
        str += " " * (hash[letter]-1) + "A" + " " * (hash[letter]-1) + "\n"
      else
        str += " " * (hash[letter] - hash[alpha]) + alpha + " " * (space) +
               alpha + " " * (hash[letter] - hash[alpha]) + "\n"
        space += 2
      end
    end
    space -= 2
    ('A'..letter).to_a.reverse.each do |alpha|
      next if alpha == letter
      if alpha == 'A'
        str += " " * (hash[letter]-1) + "A" + " " * (hash[letter]-1) + "\n"
      else
        space -= 2
        str += " " * (hash[letter] - hash[alpha]) + alpha + " " * (space) +
               alpha + " " * (hash[letter] - hash[alpha]) + "\n"
      end
    end
    str
  end
end

p Diamond.make_diamond('A')