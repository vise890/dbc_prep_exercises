def primes_upto(n)
  primes = (2..n).to_a

  primes.each do |current_prime|
    puts "Prime found: #{current_prime}"
    primes.keep_if { |x| x % current_prime != 0 || x == current_prime }
  end

  return primes
end


def prime_factors_of(n)
  primes = primes_upto(100000) # completely arbitrarily chosen. no good
  # .. but good enough for the problem
  #
  # .. also note the ridiculous RT of prime_factors_of(10) or any small no
  primes.select { |f| n % f == 0 }
end

puts prime_factors_of(600851475143).max
