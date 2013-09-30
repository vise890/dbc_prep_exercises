loop do
  puts 'WHAT DO YOU WANT?'
  want = gets.chomp
  break if want == 'exit'
  puts "WHAT DO YOU MEAN \"#{want.upcase}\"?!? YOU'RE FIRED!!"
end
