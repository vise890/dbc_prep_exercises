(1..8).each do |i|
  a = ((4 - i) * (5 - i))
  i +=1
  b = ((4 - i) * (5 - i))
  c = a - b

  puts "i: #{i} ; a: #{a} ; b: #{b} ; c: #{c}"
  # puts((' ' * n_spaces) + ('#' * (8 - n_spaces)))
end
