class Task

  attr_reader :description
  attr_accessor :completed

  alias :completed? :completed

  def initialize(args)
    args = hashify_task(args) if args.is_a? String

    @completed = args[:completed]
    @description = args[:description]
  end


  def complete!
    @completed = true
  end

  def to_s(options = {})
    human_readable = options.fetch(:human_readable, true)
    if human_readable
      complete_s = completed? ? '[ X ] ' : '[   ] '
    else
      complete_s = completed? ? 'x ' : ''
    end
    "#{complete_s}#{description}"
  end

  private

  def hashify_task(str)
    args = {}
    args[:completed] = str.match(/^x\s/) ? true : false
    str.scan(/^x?\s?([\w\s]*)/)
    args[:description] = $1
    return args
  end

end

class TaskList

  attr_accessor :task_list
  attr_reader :list_file_path, :task_class

  def initialize(list_file_path, task_class = Task)
    @list_file_path = list_file_path
    @task_list = []
    @task_class = task_class

    File.open(list_file_path, 'r').each_line do |task_s|
      @task_list.push task_class.new(task_s.chomp) unless task_s == "\n"
    end

  end

  def add(task)
    task = task.join(' ')
    task_list << task_class.new(task)
  end

  def delete(ids)
    # this is buggy (delete changes the idx of array)
    ids.each do |id|
      task_list.delete_at id.to_i
    end
  end

  def complete(ids)
    ids.each do |id|
      task_list[id.to_i].complete!
    end
  end

  def to_s(options = {})
    human_readable = options.fetch(:human_readable, true)

    str = ''
    task_list.each_with_index do |task, id|
      if human_readable
        str += "#{id}. #{task.to_s}"
      else
        str += "#{task.to_s(human_readable: false)}"
      end
      str += "\n"
    end

    return str[0..-1]

  end

  def list(args)
    # method doesn't do anything
    # just here so that class 'responds to' it 
    # not happy about this
  end

  def save_to_file
    File.open(list_file_path, 'w') do |file|
      file.write(self.to_s(human_readable: false))
    end
  end

end

TODO_FILE_PATH = './todo.txt'

class TodoApp

  def initialize(argv)

    todo_list = TaskList.new(TODO_FILE_PATH)

    command = argv.shift

    raise ArgumentError.new('Please provide a command') if command.nil?
    raise ArgumentError.new('Command not supported') unless todo_list.respond_to? command

    todo_list.send(command, argv)

    puts todo_list.to_s

    todo_list.save_to_file

  end

end

TodoApp.new(ARGV)
