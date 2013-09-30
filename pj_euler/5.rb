# returns the greatest common divisor of a and b
# uses Euclid's Algorithm
def gcd(a, b)
  while (b != 0)
    t = b
    b = a % b
    a = t
  end
  return a
end

# returns the least common multiple of a and b
def lcm(a, b)
  ((a).abs / gcd(a, b)) * b.abs
end

# removes rendundant divisors
# uses a modified version of Eratosthenes' "the Dude" Sieve for finding primes
def remove_rendundant_divisors(divisors)
  divisors = divisors.to_a.sort.reverse # max to min
  divisors.each do |divisor|
    # only keep a divisor if it does not *evenly* divide a known divisor
    # e.g. 20 % 10 == 0 so 10 is rendundant and can be discarded
    # (if n % 20 == 0 then n % 10 == 0, for all n)
    divisors.keep_if { |x| divisor % x != 0 || divisor == x }
  end
  return divisors
end

def lcm_of_several(integers)
  while integers.length > 1
    integers[0] = lcm(integers[0], integers.pop)
  end
  return integers.first
end

def profile(&block)
  start = Time.new
  block.call
  duration = Time.new - start
  puts duration
end

puts lcm_of_several(remove_rendundant_divisors(1..10))
puts lcm_of_several(remove_rendundant_divisors(1..20))
puts { lcm_of_several((1..50000).to_a) }

# ... so the remove rendundant dupes actually degrades performance
# puts profile { lcm_of_several(remove_rendundant_divisors(1..50000)) }
