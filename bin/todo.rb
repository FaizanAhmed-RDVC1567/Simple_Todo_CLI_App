# Execution of the program takes place here

require_relative "../lib/todo"   # Import statement kind of like Python or other languages.

todo = Todo.new

loop.do
  puts "\n1. Add Task\n2. List Tasks\n3. Complete Task\n4. Exit"
  print "Your choice: "
  choice = gets.to_i   # Getting input from user then converting to an integer

  case choice   # Start of case statement, the much more effective method of doing multiple if statements
  when 1
    print "\nTask: "
    task = gets.chomp
    todo.add(task)
  when 2
    puts todo.list
  when 3
    print "Task number: "
    index = gets.to_i - 1
    todo.complete(index)
  when 4
    break
  else
    puts "Invalid choice"
  end
end
