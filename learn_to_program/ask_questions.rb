def ask question
  loop do
    puts question
    reply = gets.chomp.downcase
    return true if reply == 'yes'
    return false if reply == 'no'
    puts 'Nigga please answer yes or no'
  end
end

ask 'do you suck cocks'
ask 'do you blow into them'
does_pile_have_normal_sibilings = ask 'do your parents have normal children as well, private Pile?'
puts does_pile_have_normal_sibilings
