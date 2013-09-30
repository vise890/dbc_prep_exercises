def factorial n
  raise ArgumentError if n < 0
  if n <= 1
    1
  else
    n * factorial(n-1)
  end
end

def factorial2 n

  # 1. find the smallest base case
  return 1 if n <= 1 # yes, 0! is 1 .. dunno why TODO: research it

  # 2. Imagine you have the solution for n-1 ...
  factorial_n_minus_1 = factorial n-1

  # 3. How does that help you to solve the bigger problem?
  # A factorial is n * n-1 * n-2 * n-3 *...* n-(n-1)
  return n * factorial_n_minus_1
end

puts factorial 3
puts factorial2 3

puts factorial 30
puts factorial2 30

puts factorial(-1)
