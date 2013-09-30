(1..7).each do |i|
  a = (i - 4).abs
  puts((' ' * a) + ('#' * (8 - 2 * a)))
end
