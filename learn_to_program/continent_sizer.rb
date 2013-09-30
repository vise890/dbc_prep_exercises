def continent_size world, start_x, start_y

  return 0 if world[start_x].nil? || world[start_x][start_y].nil? # don't count if off edge of world
  return 0 if world[start_x][start_y] != 'land' # don't count if it's water or visited

  size = 1 # count this tile, this is the initial value
  world[start_x][start_y] = 'visited land' # visit the land tile

  size += continent_size world, start_x-1, start_y-1
  size += continent_size world, start_x  , start_y-1
  size += continent_size world, start_x+1, start_y-1

  size += continent_size world, start_x-1, start_y
  size += continent_size world, start_x+1, start_y

  size += continent_size world, start_x-1, start_y+1
  size += continent_size world, start_x  , start_y+1
  size += continent_size world, start_x+1, start_y+1

  return size

end

# Testing 123 testing 123

# make map visually easier to read
X = 'land'
_ = 'water'

world = [[_,_,_,_,_,_,_,_,_,_,_],
         [_,_,_,_,X,X,_,_,_,_,_],
         [_,_,_,_,_,_,_,_,X,X,_],
         [_,_,_,X,_,_,_,_,_,X,_],
         [_,_,_,X,_,X,X,_,_,_,_],
         [_,_,_,_,X,X,X,X,_,_,_],
         [_,_,_,X,X,X,X,X,X,X,_],
         [_,_,_,X,X,_,X,X,X,_,_],
         [_,_,_,_,_,_,X,X,_,_,_],
         [_,X,_,_,_,X,_,_,_,_,_],
         [_,_,_,_,_,_,_,_,_,_,_]]

puts continent_size world, 5, 5

world = [[X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X],
         [X,X,X,X,X,X,X,X,X,X,X]]

puts continent_size world, 5, 5
