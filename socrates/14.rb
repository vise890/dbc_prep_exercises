def check(percentages)
  puts ((percentages.select { |e| e if e >= 0 && e <= 100 }) == percentages)
  puts percentages.collect { |e| e if e >= 0 && e <= 100 }.inspect
  puts percentages.inspect
end

check [100,90,100,99,99]
check [80,90,80,89,98]
