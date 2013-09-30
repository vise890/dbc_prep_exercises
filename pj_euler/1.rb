puts (1...1000).to_a.select{ |e| e % 3 == 0 || e % 5 == 0 }.inject(:+)
