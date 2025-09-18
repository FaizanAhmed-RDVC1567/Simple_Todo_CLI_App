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

require "rspec"
require_relative "../lib/todo.rb"

RSpec.describe Todo do
  let(:todo) {Todo.new}

  # The next four lines are a setup function, like how such functions can be set in Java, JavaScript, Python, etc.
  before do
    # Ensure we start fresh each test
    File.delete(Todo::FILE_PATH) if File.exist?(Todo::FILE_PATH)
  end

  it "starts with empty task list" do
    expect(todo.tasks).to be_empty
    # The expect 'keyword' in Ruby is like the 'assert' keyword in other languages.
  end

  it "adds a new task" do
    todo.add("Buy milk")
    expect(todo.tasks.size).to eq(1)  # 'eq' is in-built function that allows one to check if two objects are equal in Ruby.
    expect(todo.tasks.first[:task]).to eq("Buy milk")
  end

  it "marks a task as complete" do
    todo.add("Do homework")
    todo.complete(0)
    expect(todo.tasks.first[:done]).to be true
  end

  it "saves tasks to a file" do
    todo.add("Read book")
    new_todo = Todo.new  # reload from file
    expect(new_todo.tasks.size).to eq(1)
    expect(new_todo.tasks.first[:task]).to eq("Read book")
  end
end
