def profile(block_description, profiling_stats = :on, &block)
  start_time = Time.new
  yield
  duration = Time.new - start_time
  puts "#{block_description}: #{duration} s" unless profiling_stats == :off
end

profile '25,000 doublings', :off do
  n = 1
  25000.times do
    n *= 2
  end

  puts "#{n.to_s.length} digits"
end

profile 'count to a million' do
  n = 0
  1000000.times do
    n += 1
  end
  puts 'I just counted to a million'
end
