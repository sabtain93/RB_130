=begin
Problem:
Write a simple linked list implementation.
The linked list is a fundamental data structure in computer science,
often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list.
Each element in the list contains data and a "next" field pointing
to the next element in the list of elements.
This variant of linked lists is often used to represent sequences or
push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10.
Provide methods to reverse the linked list and convert a linked list to and from an array.

Problem:
create a singly linked list
list consists of elements
elements have two feilds
  first is the data
  second is the next
    next feild point to the next element in the list
this version of linked list is a LIFO stack
data feild can be any value
provide methods to reverse the linked list
provide methods to convert a linked list to and from an array

E:
we need to create classes
class: element

methods:
constructor
it accepts two argument

datum
it returns the elements data feild

tail?
it returns a boolean if the element is not at the last

next
it returns the elements next feild

class: SimpleLinkedList

Methods:
constructor
it creates a linked list object

size
returns an integer representing the size of the list

empty?
returns true if list object is empty

push
it accepts one argument
it creates a new element object with the given input


peek
returns the datum of the first but if list empty return nil

head
returns the first element object in the list

from_a (class method)





=end