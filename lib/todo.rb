require "json"

class Todo
  attr_reader :tasks
  FILE_PATH = "todo_data.json"

  def initialize
    @tasks = load_tasks  # methods that don't have arguments are usually called like this in Ruby
  end

  def add(task)
    @tasks << { task: task, done: false }
    save_tasks
  end

  def complete(index)
    if @tasks[index]
      @tasks[index][:done] = true
      save_tasks
    end
  end

  def list
    @tasks.each_with_index.map do |t, i|
      status = t[:done] ? "[x]" : "[ ]"
      "#{i+1}. #{status} #{t[:task]}"
    end.join("\n")
  end

  private

  def save_tasks
    File.write(FILE_PATH, JSON.pretty_generate(@tasks))
    # 'pretty_generate' is a method defined in the 'json' gem.
  end

  def load_tasks
    if File.exist?(FILE_PATH)
      JSON.parse(File.read(FILE_PATH), symbolize_names: true)
    else
      ["a"]
    end
  end
end
