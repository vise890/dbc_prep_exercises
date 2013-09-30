def sum_of_squares(range)
  range.map { |n| n ** 2 }.inject(:+)
end

def square_of_sum(range)
  range.inject(:+) ** 2
end

def sum_square_difference(range)
  sum_of_squares(range) - square_of_sum(range)
end

puts sum_of_squares(1..10)
puts square_of_sum(1..10)
puts sum_square_difference(1..10)

puts sum_square_difference(1..100)
