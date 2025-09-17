require "json"

class Todo
  attr_reader :tasks
  FILE_PATH = "todo_data.json"  # Just relative file path to store tasks created by the user.

  def initialize
    @tasks = load_tasks
    # methods that don't have arguments are usually called like this in Ruby.
    # Accessing the attribute properly involves using the '@' key.
  end

  def add(task)
    @tasks << { task: task, done: false }
    # Make an object containing the task description as string, along with a boolean value
    # that tracks whether the task was completed or not. Then call 'save_tasks' to save it to the file.
    save_tasks
  end

  def complete(index)
    # First check if the specified task exists inside the 'tasks' array, then access
    # the 'done' property for that object and set it to true. Then save the result in
    # the local json file.
    if @tasks[index]
      @tasks[index][:done] = true
      save_tasks
    end
  end

  def list
    # Print the entire list of todo items in a pretty way, by adding a newline character after each entry.
    @tasks.each_with_index.map do |t, i|
      status = t[:done] ? "[x]" : "[ ]"  # Ternary operation, if task completed show a box filled with an 'x'.
      "#{i+1}. #{status} #{t[:task]}"
    end.join("\n")
  end

  private

  def save_tasks
    # First of two methods not exposed to the user, this one saves the contents of the 'tasks' array to
    # the local json file.
    File.write(FILE_PATH, JSON.pretty_generate(@tasks))
    # 'pretty_generate' is a method defined in the 'json' gem.
  end

  def load_tasks
    # The second method with hidden logic reads the contents from the local json file and fills in the
    # 'tasks' array with the contents of the json file when a new instance of the Todo class is created AND
    # the JSON file already exists.
    if File.exist?(FILE_PATH)
      JSON.parse(File.read(FILE_PATH), symbolize_names: true)
    else
      []
    end
  end
end
