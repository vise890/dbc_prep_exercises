def collatz_sequence(starting_n)

  sequence = [starting_n]
  n = sequence.last

  while n > 1
    if n.even?
      sequence << (n / 2)
    elsif n.odd?
      sequence << (3 * n + 1)
    end
    n = sequence.last
  end

  return sequence

end

#######################################################
# Exercise 14
#######################################################
max_sequence_starting_n = nil
max_sequence_length = 0

(1...1000000).each do |starting_n|
  sequence_length = collatz_sequence(starting_n).length
  if sequence_length > max_sequence_length
    max_sequence_length = sequence_length
    max_sequence_starting_n = starting_n
  end
end

puts max_sequence_starting_n
