=begin
You should be able to add minutes to and subtract minutes
 from the time represented by a given Clock object.
Note that you should not mutate Clock objects when
 adding and subtracting minutes
-- create a new Clock object.

Two clock objects that represent the same time should
 be equal to each other.

You may not use any built-in date or time functionality;
 just use arithmetic operations.

PEDAC:

P:
we need to create a clock
we can add minutes and subtract minutes from it
adding and subtracting creates a new clock object
The exisiting clock does not get mutated
Two clock objects with the same time must be equal to each other

E:
from the test suite we need to create a
 class Clock and define  methods

constructor

at (class method)
- it accpets two arguments
- first argument is hours and second is minutes
- creates a new object

+
it accepts one argument
it add the minutes in the calling object
returns a new object

-
it accepts one argument
it minu the minutes in the calling object
returns a new object

to_s
returns the string formatted in hours and minutes.

==:
returns true if two objects comapres have the same time

Data:
integer to represent hour and minutes
string to output the time

Algo:
Constructor
It accepts two arguments
the first argument is hours
the second argument is min
saves hour and min for later use

class Method: to
takes two arguments
the first is hour and second is mins
the second argument has a default value of 0
it returns a new clock object

Method: +
store current time in min local variable
(call helper method compute minutes)
add the minutes passed in as argument in min
subtract the min in a day from min until it
 less than min in one day
divide the min by min in one hour to find hours and mins
(helper method compute time from mins)

Method: -
store current time in minutes in min local variable
 (call helper method compute minutes)
subtract the minutes passed in as an argument from min
add mins in minutes in one day until mins is greater than 0
call helper method (compute time from mins)

Method: ==
compare the hour and min value of both objects passed
if they values are equal then return true
(using `Interger#==`)

Method: to_s
return the string representation of time

helper method: compute mins
multiply the hour * 60 and add the minutes of calling object
return the remainder of minutes divided by 1440

helper method: compute time from mins
divide the minutes passed in as argument by 1440
the qoutient is hour and remainder are the minutes
use the remainder from divide the hour by 24 to normalize
create a new clock object
=end
class Clock
  attr_reader :hour, :mins

  def initialize(hour, mins)
    @hour = hour
    @mins = mins
  end

  def self.at(h, m = 0)
    Clock.new(h, m)
  end

  def +(minutes)
    current_mins = compute_mins + minutes
    while current_mins > 1440
      current_mins -= 1440
    end
    compute_time_from_mins(current_mins)
  end

  def -(minutes)
    current_mins = compute_mins - minutes
    while current_mins < 0
      current_mins += 1440
    end
    compute_time_from_mins(current_mins)
  end

  def ==(obj)
    hour == obj.hour && mins == obj.mins
  end

  def to_s
    "#{hour.to_s.rjust(2, '00')}:#{mins.to_s.rjust(2, '00')}"
  end

  private

  def compute_mins
    total_mins = (60 * hour) + mins
    total_mins % 1440
  end

  def compute_time_from_mins(current_mins)
    h, m = current_mins.divmod(60)
    h %= 24
    Clock.new(h, m)
  end
end
