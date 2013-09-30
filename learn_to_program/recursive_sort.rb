def dumber_sort ary
  recursive_sort ary, []
end

def recursive_sort(unsorted_ary, sorted_ary)
  while unsorted_ary.length > 0
    min = minimum_from unsorted_ary

    sorted_ary << min
    unsorted_ary.delete_at(unsorted_ary.find_index(min))

    recursive_sort unsorted_ary, sorted_ary
  end
  sorted_ary
end


def minimum_from(ary)
  min = ary[0]
  ary.each do |e|
    min = e if e < min
  end
  min
end


# testing 123, testing 123

ary1 = [1,4,1,2,6,4,7,10,3,2,15,90,3,30,4,400]
ary2 = %w(bax bax baz foo foo bar holy cow this is hard bar poo crap i_hate_sort)

puts ary1.sort == dumber_sort(ary1)
puts ary2.sort == dumber_sort(ary2)
