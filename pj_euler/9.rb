def pythagorean_triplet?(a,b,c)
  raise ArgumentError unless (a < b && b < c )
  a ** 2 + b ** 2 == c ** 2
end


