def shuffle ary
  ary = ary.dup
  shuffled_ary = []
  while ary.length > 0
    shuffled_ary << ary.delete_at(rand(ary.length))
  end
  return shuffled_ary
end

def ninja_shuffle ary
  ary.shuffle
end


# testing 123

ary = (1..100).to_a

puts ary.length == shuffle(ary).length
puts ary.length == ninja_shuffle(ary).length

puts ary.to_s
puts shuffle(ary).to_s
puts ninja_shuffle(ary).to_s
