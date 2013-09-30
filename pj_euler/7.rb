# returns an array of primes (upto a number n)
# it uses the sieve of Eratosthenes -- a.k.a. the Dude -- to compute them
#   Usage:
#     n: integer
def primes_upto(n)
  primes = (2..n).to_a

  primes.each do |prime|
    primes.keep_if { |x| x % prime != 0 || x == prime }
  end

  return primes
end

def first_nth_primes(n)
  i = 2
  primes = primes_upto(i)
  while primes.length < n
    primes = primes_upto(i)
    i = primes[-1] * 2
  end

  return primes[0...n]
end

primes =  first_nth_primes(10001)
puts primes.last.to_s
