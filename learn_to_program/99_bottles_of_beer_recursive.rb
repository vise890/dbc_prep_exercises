def no_of_bottles(n)
  if n > 1
    "#{n} bottles"
  elsif n == 1
    "1 bottle"
  elsif n == 0
    "no more bottles"
  else
    raise ArgumentError.new('anti-bottles of beer cannot be had through this program. Although they may exist')
  end
end


def print_lyrics(n_bottles, initial_no_of_bottles)

  str = ''

  str += "#{no_of_bottles(n_bottles)} of beer on the wall " * 2 + "\n"

  # base case: 1 bottle of beer left on the wall
  if n_bottles - 1 < 1
    str += "Go to the store and buy some more, #{no_of_bottles(initial_no_of_bottles)} of beer on the wall.\n\n\n"
  elsif n_bottles - 1 >= 1
    str += "Take one down, pass it around, #{no_of_bottles(n_bottles.to_i - 1)} of beer on the wall.\n\n"
    str += print_lyrics((n_bottles.to_i - 1), initial_no_of_bottles)
  end

  return str

end

def print_n_bottles_of_beer_lyrics(n_bottles)
  print_lyrics(n_bottles, n_bottles)
end

puts print_n_bottles_of_beer_lyrics(10)
puts print_n_bottles_of_beer_lyrics(1)
