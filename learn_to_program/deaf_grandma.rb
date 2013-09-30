number_of_goodbyes = 0
loop do
  input = gets.chomp
  if input == 'BYE'
    number_of_goodbyes += 1
    puts '...'
    break if number_of_goodbyes == 3
  else
    number_of_goodbyes = 0
    if input == input.upcase
      # grandma understands
      random_year = rand 1930..1950
      puts "NO, NOT SINCE #{random_year}"
    else
      # grandma doesn't understand
      puts 'HUH?!  SPEAK UP, SONNY!'
    end
  end
end
