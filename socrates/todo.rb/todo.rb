TODO_TXT = './todo.txt'

# -------

class Todo
  attr_reader :name, :id, :completed

  def initialize(name, id)
    @name = name
    @id = id
    @completed = true
  end

  def complete
    @completed = true
  end

  def completed?
    @completed
  end

end

class TodoList

  def initialize

    File.open(TODO_TXT, 'r') do
      #
    end
  end

  def add(todo)
      #
  end

  def delete(todo_ids)
      #
  end

  def complete(todo_ids)
      #
  end

  def list
      #
  end

  def each
    #
  end
end

class TodoApp

  def initialize
    action = ARGV[0]
    params = ([].push(ARGV[1..-1])).flatten

    todo_list = TodoList.new

    case action
    when list
      todo_list.list
    when delete
      todo_list.delete(params)
    when add
      todo_list.add(params)
    when complete
      todo_list.complete(params)
    end
  end

end
