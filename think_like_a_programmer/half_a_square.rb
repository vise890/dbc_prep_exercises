5.downto(1) do |n|
  puts '#' * n
end

(1..5).each do |n|
  puts '#' * (6-n)
end
