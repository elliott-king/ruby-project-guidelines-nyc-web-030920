require_relative '../config/environment'

prompt = TTY::Prompt.new()
system("clear")

name = prompt.ask("What is your name?")
gpa = prompt.ask("What is your gpa?").to_f
keywords = prompt.ask("What kind of jobs would you like to search for?").downcase.split()
positions = Position.all.select do |pos|
  t = pos.title.downcase
  keywords.any? {|word| t.include?(word)}
end
positions.each {|pos| puts pos.title + " " + pos.location}