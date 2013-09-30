def factorial(n)
  if n == 1
    return 1
  else
    return n * factorial(n-1)
  end
end

def digit_sum(n)
  sum = 0
  n.to_s.each_char do |char|
    sum += char.to_i
  end
  return sum
end

puts digit_sum(factorial(100))
