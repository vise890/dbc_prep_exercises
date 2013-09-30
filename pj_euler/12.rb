def divisors(n)
  (1..n).to_a.keep_if { |e| n % e == 0 }
end

def nth_triangular_number(n)
  (1..n).inject(:+)
end

def number_of_divisors(nth_triangular_numeber)
  n = nth_triangular_numeber
  return n * (n + 1) / 2
end

(1..7).each do |tri|
  puts number_of_divisors(tri)
end
