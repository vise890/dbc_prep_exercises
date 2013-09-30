user = ARGV.first
prompt = '~> '
puts "Hi #{user}, I'm the #{$0} script."
puts "I'd like to ask you a few questions."
puts "Do you like me #{user}?"
print prompt
likes = STDIN.gets.chomp() # note: using STDIN because using a plain chomp would try to use ARGV.first as an argument.. and we don't want that

puts "Where do you live #{user}?"
print prompt
lives = STDIN.gets.chomp()

puts "What kind of computer do you have?"
print prompt
computer = STDIN.gets.chomp()

puts <<MESSAGE
Alright, sho you saild #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer} computer.  Nice.
MESSAGE
