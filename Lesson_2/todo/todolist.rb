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
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? {|obj| obj.done? }
  end

  def item_at(idx)
    todos.fetch(idx)
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
    item = item_at(idx)
    todos.delete(item)
  end

  def to_s
    str = "---- #{title} ----\n"
    str << todos.map(&:to_s).join("\n")
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

  # def find_by_title(str)

  #   select do |todo|
  #     todo.title == str
  #   end.todos.first
  # end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

    def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(str)
    if !find_by_title(str).instance_of?(Todo)
      raise("Invalid title")
    end
    find_by_title(str).done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  protected

  attr_accessor :todos
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# todo3.done!
# todo2.done!
#p list.find_by_title("Go to gym")
# p list.all_done
# p list.all_not_done
# p list.mark_done("Go to gym")
 # p list.mark_all_done
# p list.mark_all_undone