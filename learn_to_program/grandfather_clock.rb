def grandfather_clock_call &block
  hour = Time.new.hour
  if hour == 0 || hour == 12
    n == 12
  else
    n = hour % 12
  end

  n.times do
    yield
  end
end

grandfather_clock_call do
  puts 'DONG!'
end
