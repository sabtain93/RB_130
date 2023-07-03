=begin
When robots come off the factory floor, they have no name.
The first time you boot them up,
a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to
 its factory settings,
which means that their name gets wiped. The next time you ask,
 it will respond with a new random name.

The names must be random; they should not follow a predictable sequence.
Random names means there is a risk of collisions.
Your solution should not allow the use of the same name twice.

PEDAC:

P:
- generate a random name
- the name first two charcters are alphabets and last three are digits
- the name is five characters long
- when the robot is reset a new name is generated and it cannot be the same
as the previous one

E:
- we need a class Robot
- constructor
  creates a new name random
  check if it was not used before
 - name
  return the current name
 - rest
  generates a new name for exisiting robot
  check if it was not used previously

D:
array of strings

A:
constructor:
creates a new robot and assigns name for the robot
check if the name was not used before
saves the new name in name directory for history

name:
returns the current name

reset:
generates a new name for exisitintg robot
check if it was not used before in the name directory

helper method
generate name for robot
first two are alphabets
the next three are numbers
=end
class Robot
  attr_accessor :name

  @@names = []

  def initialize
    @name = set_name
  end

  def reset
    @@names.delete(name)
    self.name = set_name
  end

  def self.names
    @@names
  end

  private

  def generate_name
    str = ""
    2.times do
      str += ('A'..'Z').to_a[rand(0..25)]
    end
    str += rand(100..999).to_s
  end

  def set_name
    loop do
      str = generate_name
      if !@@names.include?(str)
        @@names << str
        return str
      end
    end
  end
end
