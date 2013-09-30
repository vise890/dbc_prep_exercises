def print_99_bottles_of_beer_lyrics(n_bottles)
  str = ''

  n_bottles.downto(1) do |n|
    str += "#{no_of_bottles(n)} of beer on the wall, #{no_of_bottles(n)} of beer.\n"
    if (n - 1) > 0
      str += "Take one down, pass it around, #{no_of_bottles(n-1)} of beer on the wall.\n\n"
    else
      str += "Go to the store and buy some more, #{no_of_bottles(n_bottles)} of beer on the wall.\n\n"
    end
  end

  puts str
end

def no_of_bottles(n)
  if (n) > 1 
    "#{n} bottles"
  elsif (n) == 1
    "1 bottle"
  elsif (n) == 0
    "no more bottles"
  end
end

puts print_99_bottles_of_beer_lyrics(99)
puts print_99_bottles_of_beer_lyrics(20)
puts print_99_bottles_of_beer_lyrics(1)
