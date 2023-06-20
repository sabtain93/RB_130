Q_1

# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, 
# and the sum of the lengths of any two sides must be greater than the length of the third side.


# P-:

# to be valid triangle all sides length must be greater than 0
# to be valid triangle the sum of any two sides must be greater than the third side.
# equilateral triangle has all three sides of the same length
# isosceles has exactly two sides of same length
# scalene has all sides of different length 

# E-:

# From the provided examples

# We need a class triangle with two methods

# constructor:
# it accepts three arguments which represents the three lengths of the triangle.
#   - raises argument error if any of the lengths is less than zero
#   - raises argument error if the sum of any two sides is less than third side

# kind:
# it returns a string that represents the type of triangle


# D-:
# array to store lenghts of the trianlge
# string to return the type of triangle
# numbers to represents the length of each side.

# algo:

# constructor:
# - saves the three side lengths
# - check if any side length is less than or equal to zero. if so raise an exception
# - check if the sum of any two sides is less than or equal to the length of the third side if so
# raise an exception

# Method: `kind`
# - compare the values representing the three side lengths
# - if all three side lengths are equal return 'equilateral'.
# - if not equilateral but any two sides are of equal length then return 'isloceles'
# - if none of the sides are equal then return 'scalene'

Q_2


# PEDAC

# P-:
# Find the hamming distance between DNA strands
# find the difference in two alphabet sequences
# If sequence are of different lenghts then we have to find the hamming distance over the shorter length.

# E-:
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# G A G C C T A C T A A C G G G A T
# C A T C G T A A T G A C G G C C T

# iterate over the shorter string


# in the above example the hamming distance is 7

# from the provided test cases we need a class DNA and require two methods
# Constructor

#   it takes accpets one argument (string)
#   empty string `''` is a valid input

# hamming_distance

#   it accpets one argument(string)
#   it uses comapres the two string character wise and returns integer
#   the returned integer represents the hamming distance

# D-:
# input is string
# use array to store characters
# output integer

# A-:
# constructor:
# - accept DNA strand string as an argument
# - save it for later use

# Method: hamming_distance
# - compare both DNA strands to compute which is shorter
# - spilt the string into characters and store in an array
# - set counter = 0
# - iterate over the size of the shorter array
#   - compare each character
#   - if not equal
#     - increment counter value by 1
#   - return counter

Q_4.rb

# problem:
# Write a program that takes a word and a list of possible anagrams and selects the correct
# sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets",
# and "banana", the program should return a list containing "inlets".
# Please read the test suite for the exact rules of anagrams.

# PEDAC:

# p-:
# input : string of arrays
# output: string of arrays

# select all the anagrams of the string from the provided list of strings
# a string is anagram of another if it holds all the letters of the original string once
# the anagram is case in-sensitive
# the word and its anagram are of the same length
# the same word is not an angram the order must be different
# select all the possible anagrams and return string array
# if no anagrams are found return empty array

# Examples:

# From the given test suit we need a `Anagram` class and two methods

# constructor:
# - it accpets one argument a string for which anagrmas are to be selected
# - it raises no error as the argument passed is always a valid string

# match:
# it accpets one argument an array of strings
# return the array with anagrams detected.

# Data structure:
# - string for the word passed to constructor
# - array of strings

# Algorithm:
# constructor:
# - save the string passed to it for later use

# method: match

# - initialize result local varible to empty array to store possible anagrams
# - iterate over the input array and select only those strings who have the same length
# and is not equal to the saved string
#   - save the result in selected array
# - iterate over the selected array
#   - check for current string 
#   - if all characters are available in the saved string
#     store the string in result array
# - return the result array
# - use helper method where required

Q_5


# problem:
# Write a program that, given a word, computes the Scrabble score for that word.

# Letter                        Value
# A, E, I, O, U, L, N, R, S, T    1
# D, G                            2
# B, C, M, P                      3
# F, H, V, W, Y                   4
# K                               5
# J, X                            8
# Q, Z                           10

# P:
# given a string find the scramble score accordingly
# return the final score
# the letters are case insensitive so a and A both have the same score
# the input string must be valid
# nil, empty string or string with no alphabets is not valid
# non valid strings return a `0` score

# E:
# From the test suite provided we need to create a `Scrabble` class and two methods

# construtor:
# It accpets one argument (string)

# score:
# this checks the score of the input string
# returns the integer representation of the final score


# D:
# a constant hash to store the tile scores
# the hash key will be an array of words and value the corresponding integer score

# array to store the characters of the input string

# integer to store the score

# Algo:
# create a constant score tile and store a Hash in it

# Constructor:
# - save the input string to be used later
# - ignore bad input at this time

# Method: score
# - initialize a local variable score to 0
# - iterate over the characters downcased of the saved string
#   - iterate over the constant hash
#     - if current hash key has the current character
#       - increment value of score by one
# - return the final value of score

# Method: score (class method)
# - accpet a string argument and save it
# - use the constructor and score method abvoe
# - return the score

Q_6


# Problem:
# Write a program that can tell whether a number is perfect, abundant, or deficient.

# PEDAC:

# P:
# the sum of the divisiors of a number excluding itself is the aliquot sum
# if the aliquot sum is equal to the number itslef it is a perfect number
# if the aliquot sum is greater than the original number, it is a abundant number
# if the aliquot sum is less than the original number, it is a deficient number
# only positive numbers are valid
# all prime numbers are deficient as there only divisor is 1

# E:
# from the test suite provided we need to create a calss `Perfectnumber`
# one methods

# classify (class method)
# it accpets one argument
# the argument is a positive integer
# negative numbers raise an exception
# assess the integer type
# return the string type


# D:
# integer
# string

# Algo:
# method: classify (class method)
# it accpets one argument and saves the integer passed
# raise an exception if the integer is less than 0
# initialize divisor local varibale to an empty array
# iterate from 1 till one less than the integer
# find all the divisors
# store the divisors in the divisor array
# find the sum of the elements of divisor array
# if the sum is equal to input integer
#   return the string 'perfect'
# if the sum is less than input integer
#   return the string 'deficient'
# if the sum is greater than input integer
#   return the dtring 'abudant'

Q_7


# Problem:
# implement octal to decimal conversion.
# Given an octal input string, your program should produce a decimal output.
# Treat invalid input as octal 0.

# PEDAC:

# P:
# input is a string representation of octal number
# convert octal to decimal
# octal has a base 8 and decimal has a base 10
# ivalid inputs are alphabets and combination of numbers greater than 7
# for invalid inputs return 0

# E:
# From the test suite provided we need to create a class Octal
# and two methods

# constructor:
# It accepts one argument and saves it

# to_decimal:
# It converts the octal string representation into decimal
# return the decimal number

# D:
# array of characters
# string
# integer

# Algo:
# constructor:
# accept string argument and save it for later use
# convert invalid input to 0

# Method: to_decimal
# convert the string into characters and store in char_arr
# set counter to size of char_arr - 1
# iterate over the char_arr
# multiply each char interger form with with 10 ^ counter
# add the result to an array
# decrement the counter by 1
# return the sum of the array


Q_8

Write a program that, given a natural number and a set of one or more other numbers,
# can find the sum of all the multiples of the numbers in the set that are less than the first number.
# If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of
# either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78

# PEDAC:

# P:
# - input 1: set of integers or if not given then assume 3 and 5
#   the set can vary it can be two numbers it can be 3 numbers
#   they are set in ascending order
# - input 2: an integer

# output: Integer(sum of multiples)
#   find the sum of the multiples of the numbers in the set till but not including the second input.
#   if there is a common multiple consider it only once
#   if a set is not provided then consider 3 and 5

# E:
# from the example suite provided we need to create a class `SumofMultiples`
# and three methods

# Constructor:
# - it accpets one argument

# to (class method)
# it accpets one argument
# computes the sum of multiplies of 3 and 5 from 1 till one less than input integer

# to (instance method)
# it accpets one argument
# computes the sum of all the multiplies of each number in the provided set till one less than the 
# integer input

# D:
# array of integers
# integer(sum of all the multiples)

# A:
# Consturctor:
# -It accepts a set of integer arguments
# -save the set of arguments in an array for later use

# Method: to (class method)
# - initilaize local variable sum to 0
# - iterate over the range of number from 1 till one less than integer passed in
#   - check if current integer is a multiple of 3
#     - increment the value of sum by the current integer
#   - if not then check if current integer is a multiple of 5
#     - increment the value of sum by the current integer
# return the value of sum local variable

# Method: to (instance method)
# - initialize local variable to 0
# - iterate over the range from 1 till one less than the number provided
#   - iterate over the array of numbers
#     - check if current integer is a multiple of current element
#       - increment sum by the current integer
#       - break the inner iteration
# - return the value of sum
