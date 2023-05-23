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
    todos.clone
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

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    temp = TodoList.new('selected todos')
    each do |todo|
      if yield(todo)
        temp.todos << todo
      end
    end
    temp
  end

  protected

  attr_accessor :todos


end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect