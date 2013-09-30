# reads a number one digit at a time and then prints it
number = 0
input = gets.chomp

until input == ''
  number = (number * 10 + input.to_i)
  input = gets.chomp
end

puts number
