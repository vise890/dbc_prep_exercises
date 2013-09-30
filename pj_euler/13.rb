numbers = []

File.open('./13.txt', 'r').each_line do |l|
  numbers << l.chomp.to_i
end

puts numbers.inject(:+).to_s[0...10]
