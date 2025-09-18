=begin
MIT License

Copyright (c) 2025 FaizanAhmed-RDVC1567

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=end

# Execution of the program takes place here.

require_relative "../lib/todo"   # Import statement kind of like Python or other languages.

todo = Todo.new

loop.do
  puts "\n1. Add Task\n2. List Tasks\n3. Complete Task\n4. Exit"
  print "Your choice: "
  choice = gets.to_i   # Getting input from user then converting to an integer.

  case choice   # Start of case statement, the much more effective method of doing multiple if statements.
  when 1
    print "\nTask: "
    task = gets.chomp  # Looks like this method allows the user to enter a stream of characters.
    todo.add(task)
  when 2
    puts todo.list  # Print out the contents of the whole list and insert a newline character.
  when 3
    print "Task number: "
    index = gets.to_i - 1
    # Retrieve the proper task number from the user, then subtract 1 to get the proper index
    # of the item in the list. (Ruby also starts indexing from 0). Then set the 'complete' attribute to true.
    todo.complete(index)
  when 4
    break
  else
    puts "Invalid choice"  # Dealing with any other choice made by the user.
  end
end
