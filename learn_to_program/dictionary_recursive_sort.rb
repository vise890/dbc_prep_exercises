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
    min = e if e.upcase < min.upcase
  end
  min
end


# testing 123, testing 123

ary = %w(bax Bax baz foo foo bar Holy Cow this is hard bar Poo crap i_hate_sort)

puts dumber_sort ary
