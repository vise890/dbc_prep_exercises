def primes_below(n)
  primes = (2...n).to_a
  primes.each do |prime|
    primes.keep_if { |n| n % prime != 0 || n == prime }
  end
  return primes
end

puts primes_below(10).inject(:+)
puts primes_below(2000000).inject(:+)
