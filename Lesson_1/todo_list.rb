
# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation


  def add(todo_item)
    raise TypeError.new("Can only add Todo objects") if todo_item.class != Todo
    todos.push(todo_item)
    todos
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first.to_s
  end

  def last
    todos.last.to_s
  end

  def to_a
    todos.map(&:to_s)
  end

  def done?
    todos.all? {|obj| obj.done? }
  end

  def item_at(idx)
    todos.fetch(idx).to_s
  end

  def mark_done_at(idx)
    todos.fetch(idx).done!
  end

    def mark_undone_at(idx)
    todos.fetch(idx).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete_at(idx)
  end

  def to_s
    str = "------#{title}------"
    counter = 0
    while counter < todos.size
      str += "\n#{item_at(counter)}" 
      counter += 1
    end
    str
  end

  protected

  attr_accessor :todos


end

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end





# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
p list.class
p list.add(todo1)                 # adds todo1 to end of list, returns list
p list.add(todo2)                 # adds todo2 to end of list, returns list
p list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# # size
p list.size                       # returns 3

# # first
p list.first                      # returns todo1, which is the first item in the list

# # last
p list.last                       # returns todo3, which is the last item in the list

# #to_a
p list.to_a                      # returns an array of all items in the list

# #done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# # item_at
# p list.item_at                    # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# p list.mark_done_at               # raises ArgumentError
p list.mark_done_at(1)            # marks the 2nd item as done
# p list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# p list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# p list.mark_undone_at(100)        # raises IndexError

# # done!
# p list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# p list.shift                      # removes and returns the first item in list

# # pop
# p list.pop                        # removes and returns the last item in list

# # remove_at
# p list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# p list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
puts  list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym