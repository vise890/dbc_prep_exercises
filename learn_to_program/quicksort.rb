def quicksort ary
  return ary if ary.length <= 1

  pivot = ary.pop

  lower_than_pivot = ary.select { |e| e < pivot }
  higher_than_pivot = ary.select { |e| e >= pivot }

  quicksort(lower_than_pivot) + [pivot] + quicksort(higher_than_pivot)

end

ary = (1..1000).to_a.shuffle

puts ary.sort.to_s
puts quicksort(ary).to_s
