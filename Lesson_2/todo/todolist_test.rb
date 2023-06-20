require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    return_val = @list.shift

    assert_equal(@todo1, return_val)
    assert_equal(2, @list.size)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    return_val = @list.pop

    assert_equal(@todo3, return_val)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @todos.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  def test_add
    assert_raises(TypeError) { @list.add(5)}
    assert_raises(TypeError) { @list.add('hi')}
  end

  def test_shovel
    todo4 = Todo.new("Test Todo")
    @list << todo4

    assert_equal(4, @list.size)
    assert_includes(@list.to_a, todo4)
  end

  def test_item_at
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(12) }

    @list.remove_at(1)

    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_done_at(2)
    assert_equal(output, @list.to_s)
  end

    def test_to_s_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_iterating
    result = []
    @list.each { |elem| result << elem }
    assert_equal([@todo1, @todo2, @todo3], @list.to_a)
  end

  def test_each_return
    result = @list.each {|elem| elem.done? }

    assert_same(result, @list)
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

     assert_equal(list.title, @list.title)
     assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end

end

  # Your tests go here. Remember they must start with "test_"
#   def test_to_a
#     assert_equal(@todos, @list.to_a)
#   end

#   def test_size
#     assert_equal(3, @list.size)
#   end

#   def test_first
#     assert_equal(@todo1, @list.first)
#   end

#   def test_last
#     assert_equal(@todo3, @list.last)
#   end

#   def test_shift
#     obj = @list.shift
#     assert_equal(@todo1, obj)
#     assert_equal([@todo2, @todo3], @list.to_a)
#   end

#   def test_pop
#     obj = @list.pop
#     assert_equal(@todo3, obj)
#     assert_equal([@todo1, @todo2], @list.to_a)
#   end

#   def test_done?
#     assert_equal(false, @list.done?)
#   end

#   def test_typeerror
#     assert_raises(TypeError) { @list.add(1) }
#     assert_raises(TypeError) { @list.add('yo') }
#     assert_raises(TypeError) { @list.add(:hi) }
#   end

#   def test_shovel_method
#     todo4 = Todo.new("test todo")
#     @list << todo4
#     assert_includes(@list.to_a, todo4)
#   end

#   def test_shovel_method
#     todo4 = Todo.new("test todo")
#     @list.add(todo4)
#     assert_includes(@list.to_a, todo4)
#   end

#   def test_item_at
#     assert_raises(IndexError) { @list.item_at(3)}
#     assert_equal(@todo1, @list.item_at(0))
#   end

#   def test_mark_done_at
#     assert_raises(IndexError) { @list.mark_done_at(3) }
#     @list.mark_done_at(0)
#     assert_equal(true, @todo1.done?)
#     assert_equal(false, @todo2.done?)
#     assert_equal(false, @todo3.done?)
#   end

#   def test_mark_undone_at
#     assert_raises(IndexError) { @list.mark_undone_at(3) }
#     @todo1.done!
#     assert_equal(true, @todo1.done?)
#     @list.mark_undone_at(0)
#     assert_equal(false, @todo1.done?)
#   end

#   def test_done!
#     @list.done!
#     assert_equal(true, @todo1.done?)
#     assert_equal(true, @todo2.done?)
#     assert_equal(true, @todo3.done?)
#     assert_equal(true, @list.done?)
#   end

#   def test_remove_at
#     assert_raises(IndexError) { @list.remove_at(3) }
#     @list.remove_at(1)

#     assert_equal([@todo1, @todo3], @list.to_a)
#   end

#   def test_to_s
#     output = <<~OUTPUT.chomp
#     ---- Today's Todos ----
#     [ ] Buy milk
#     [ ] Clean room
#     [ ] Go to gym
#     OUTPUT
#     assert_equal(output, @list.to_s)

#     @todo1.done!
#     output = <<~OUTPUT.chomp
#     ---- Today's Todos ----
#     [X] Buy milk
#     [ ] Clean room
#     [ ] Go to gym
#     OUTPUT
#     assert_equal(output, @list.to_s)

#     @list.done!
#     output = <<~OUTPUT.chomp
#     ---- Today's Todos ----
#     [X] Buy milk
#     [X] Clean room
#     [X] Go to gym
#     OUTPUT
#     assert_equal(output, @list.to_s)
#   end

#   def test_each
#     result = []
#     return_val = @list.each { |todo| result << todo }
#     assert_equal([@todo1, @todo2, @todo3], result)
#     assert_equal(@list, return_val)
#   end

#   def test_select_returns_new_obj
#     result = @list.select { |todo| nil }
#     assert_instance_of(TodoList, result)
#   end

# end