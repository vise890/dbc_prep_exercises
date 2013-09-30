class ListFile

  def initialize(file_path)
    @file_path = file_path
  end

  def each
    File.open(@file_path, 'r') do |line|
      yield line
    end
  end

  def each_with_index
    idx = 0
    self.each do |line|
      yield line, idx
      idx += 1
    end
  end

  def []=(idx)

  end

  def [](idx)
    self.each_with_index do |line, j|
      if j == idx
        return line
      end
    end
  end

end

class Todo

  attr_reader :description, :completed

  def initialize(description, completed = false)
    @description = description
    @completed = completed
  end

  def completed?
    @completed
  end

  def complete!
    @completed = true
  end

  def to_s(options = {})
    if options[:human_readable]
      completed_str = self.completed? ? '[ x ] ' : '[   ] '
    else
      completed_str = self.completed? ? 'x ' : ''
    end
    "#{completed_str}#{self.description}"
  end

end

class TodoList

  attr_accessor :todo_list

  def initialize(todo_file_path)
    @todo_file_path = todo_file_path
    @todo_list = get_todo_list_from_file
  end

  def list
    self.each_with_index do |todo, idx|
      puts "#{idx} :: #{todo.to_s(human_readable: true)}"
    end
  end

  def add(description)
    self.todo_list << Todo.new(description)
  end

  def complete(id)
    self.todo_list[id].complete!
  end

  def delete(id)
    self.todo_list.delete_at id
  end

  def each(&block)
    self.todo_list.each do |todo|
      block.call todo
    end
  end

  def each_with_index(&block)
    self.todo_list.each_with_index do |todo, idx|
      block.call todo, idx
    end
  end

  def save_list_to_file
    File.open(@todo_file_path, 'w') do |file|
      file.write("#{self.to_s}\n")
    end
  end

  def to_s
    str = ''
    self.each do |todo|
      str += todo.to_s
    end
    return str
  end
  private

  def get_todo_list_from_file
    line_number = 0
    todos = []
    File.open(@todo_file_path, 'r').each_line do |todo_line|
      todos << str_to_todo(todo_line) unless todo_line == "\n"
      line_number += 1
    end

    return todos
  end

  def str_to_todo(str)
    str.scan(/^x?\s?([\w\s]*)/)
    description = $1
    completed = true if str.match(/^x\s/)

    return Todo.new(description, completed)
  end

end

TODO_TXT_PATH = './todo.txt'
class TodoApp
  def initialize(argv)
    l = TodoList.new(TODO_TXT_PATH)
    raise ArgumentError.new('command not found') if !l.respond_to?(argv.first.to_sym)

    command = argv.shift.to_sym
    case command

    when :list
      l.list
    when :add
      l.add argv.join(' ')
      l.list
      l.save_list_to_file
    when :delete
      argv.each do |idx|
        l.delete idx.to_i
      end
      l.list
      l.save_list_to_file
    when :complete
      argv.each do |idx|
        l.complete idx.to_i
      end
      l.list
      l.save_list_to_file
    end
  end
end

TodoApp.new(ARGV)
