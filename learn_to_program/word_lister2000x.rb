words = []
loop do
  word = gets.chomp
  break if word == ''
  words << word
end
puts words.sort
