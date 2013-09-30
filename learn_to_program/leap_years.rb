year = gets.chomp.to_i

if year % 4 == 0
  if year % 100 == 0
    if year % 400 == 0
      puts 'leap'
    else
      puts 'non-leap'
    end
  else
    puts 'leap'
  end
end
