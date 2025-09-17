class Todo
  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << { task: task, done: false }
  end

  def complete(index)
    @tasks[index][:done] = true if @tasks[index]
  end

  def list
    @tasks.each_with_index.map do |t, i|
      status = t[:done] ? "[x]" : "[ ]"
      "#{i+1}. #{status} #{t[:task]}"
    end.join("\n")
  end
end
