sum = 0
(2 ** 1000).to_s.each_char do |char|
  sum += char.to_i
end

puts sum
