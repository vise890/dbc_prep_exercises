def fib(max_n)
  fibs = [1,2]
  loop do
    next_fib = fibs[-1] + fibs[-2]
    if next_fib < max_n
      fibs << next_fib
    else
      break
    end
  end

  return fibs
end

puts fib(4000000).select{ |e| e.even? }.inject(:+)
