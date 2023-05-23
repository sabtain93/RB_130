# question 1

assert(value.odd?, "value is not odd")

`#assert` test if the first argument is truthy, if the first argument is not truthy the test fails.
The second argument is the failure message, which not all assertion lets us display.usally the messages are quite descriptive so we really do not need to write our own.

# question 2

assert_equal('xyz', value.downcase)

`#assert_equal` test if the two arguments are equal using the `#==` method.
The failure message assumes that the first argument represents the expected value and the second argument represents the actual value. So it is important to maintain this convention so the error mesage makes sense.

# question 3

assert_nil(value)

`#assert_nil` fails unless the arguemnt is not `nil`

# question 4

assert_empty(list)

`#assert_empty` tests if its first argument responds to the `#empty?` with a true value.

# question 5

assert_includes(list, 'xyz')

assert_includes checks if the first argument includes the second argument 

# question 6

assert_raises(NoExperienceError) { employee.hire}

This assertion checks if the given block raises the named exception

if it does not then an error is raised 

# Question 7 

assert_instances_of(Numeric, value)

`assert_instance_of` uses the `Object#instance_of?` to ensure that its second argument is an instance of the class named as its first argument.


# Question 8

assert_kind_of(Numeric, value)

The above test fails if the second argument's class is not the instance of the named class or its subclasses.


# Question 9

assert_same(list, list.process) 

The above fails if the first and the second argument are not the same objects. which is determined by the #equal mehtod.

# Question 10

refute_includes(list, 'xyz')

the above is a refute which fails is the second argument is included in the named collection.