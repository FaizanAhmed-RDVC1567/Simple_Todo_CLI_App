require "rake"
require "rspec/core/rake_task"

# Define an RSpec task
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/**/*_spec.rb"  # All test files
end

# Default task: run specs
task default: :spec

# Custom task: Clears the saved todo json file
task :reset do
  file = "todo_data.json"
  if File.exist?(file)
    File.delete(file)
    puts "Tasks reset!"
  else
    puts "No tasks to reset."
  end
end
