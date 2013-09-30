puts 'Which year were you born in?'
year = gets.chomp.to_i

puts 'Which month were you born in?'
month = gets.chomp.to_i

puts 'Which day were you born in?'
day = gets.chomp.to_i

birth = Time.new(year, month, day)
age = (Time.now - birth)/ (60 * 60 * 24 * 365)

age.to_i.times { puts 'SPANK' }
puts "You got spanked #{age.to_i} times"
