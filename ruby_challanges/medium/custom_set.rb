=begin
Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type,
like a set. In this exercise you will define your own set type.
How it works internally doesn't matter, as long as it behaves like
a set of unique elements that can be manipulated in several well defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set type.
For this problem, you're expected to implement your own custom set type.

For simplicity, you may assume that all elements of a set must be numbers.

PEDAC:

P:
we have to create a set type
all elements are to be unique
The interla working does not matter
The set type should be able to be mainpulated in several ways that are defined
implement a custom set type
all elements of the set must be numbers

E:
need to create a class CustomSet

Constructor
it accpets one optional argument

empty?
returns true if the set is empty
false otherwise

contains?
takes one argument
returns true if calling object contains the argument passed in
returns false otherwise

subset?
takes one argument (CustomSet object)
returns true if calling object is subset of the set passed in as argument
returns false otherwise

disjoint?
takes one argument (CustomSet object)
returns true  or false

eql?
takes one argument
returns true if both arrays are same
(the uniue elements are the same and order does not matter)

==
it takes one argument
checks if both set are the same length and each values

add
takes one argumnet
add it to the calling set object

intersection
takes one argument
retuns a new CustomSet object
check common elements in calling set obejct and passed in set obj

difference
take one argument (set obj)
returns a new set obj with elements that are not common between the two set obj

union
takes one argument
returns a new set obj whose elements are the union of the two sets

D:
use array to respresent a set

A:
constructor
save the passed in argument
if no argument is passed then use empty array

empty?
check if the passed in obj is empty
return true if yes
otherwise false

contains?
check if the passed in argument is included in the
calling set obj
return true if yes
otherwise return false

subset?
if calling obj length is smaller than the obj passed in
  then check if all the elements in the
  calling obj are included in the obj passed in
  return true if yes
  otherwise return false
empty set is a subset of non empty
empty set is a subset of empty

disjoint?
if passed in obj and calling obj are empty
  return true
if either one is empty
  return true
if have any element common
  return false
else
  return true

eql?
sort the input set and remove duplicate elements
sort the calling set and remove duplicate elements
if both are sets are equal
  return true
else
  return false

==
returns true if the calling and passed in
set have same length and same elements in the same order

add
save the input argument
update the calling set by adding the passed in the argument
return the updated set obj

intersection
save the input set obj
both set obj empty
  return a new empty set obj
either one empty
  return a new empty set obj
if no common elements
  return new empty set obj
if any common
  return new set obj with the common elements

diffrence
if both empty
  return a new empty set object
if either is empty
  return the a new set object whose
  elements are the elements of non emptys set object
if common elements
  return a new set obj whose elements are the elements
   of the calling set object minus the common elements

union
return a new set object which is the
concatination of both the arrays
delete any duplicates after concatination
sort the elements in the set after concatination
=end

class CustomSet
  attr_accessor :set

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(obj)
    arr1 = set
    arr2 = obj.set

    arr1.all? do |elem|
      arr2.include?(elem)
    end
  end

  def disjoint?(obj)
    arr1 = set
    arr2 = obj.set

    arr1.all? do |elem|
      !arr2.include?(elem)
    end
  end

  def eql?(obj)
    arr1 = set
    arr2 = obj.set

    arr1.uniq.sort == arr2.uniq.sort
  end

  def ==(obj)
    obj.set == set
  end

  def add(num)
    if set.include?(num)
      CustomSet.new(set)
    else
      CustomSet.new(set << num)
    end
  end

  def intersection(obj)
    arr1 = set
    arr2 = obj.set

    arr = if arr1.length > arr2.length
            arr2.select { |elem| arr1.include?(elem) }
          else
            arr1.select { |elem| arr2.include?(elem) }
          end

    CustomSet.new(arr.sort)
  end

  def difference(obj)
    arr = set - obj.set
    CustomSet.new(arr)
  end

  def union(obj)
    arr = set + obj.set

    CustomSet.new(arr.uniq.sort)
  end
end
