def fib(n)
  if n == 1 || n == 2
    return 1
  else
    fibs = [1,1]
    (n-2).times do
      fibs << fibs[-1] + fibs[-2]
      fibs = fibs.pop(2)
    end
    return fibs[-1]
  end
end

n = 1
while fib(n).to_s.length < 1000
  n += 1
end

puts n
