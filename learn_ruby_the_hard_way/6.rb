# assign a string to the variable x. string interpolation for 10
x = "There are #{10} types of people."
# assign the string "binary" to variable binary
binary = "binary"
# assign the string "don't" to the variable do_not
do_not = "don't"

# assign the string to variable y
# note that binary and do_not are instances of string interpolation
# i.e., their values will be substituted
y = "Those who know #{binary} and those who #{do_not}."

# print strings x and y to the screen
puts x
puts y

# do_not = "do not"
# print some other bs to the screen, interpolation happening
puts "I said: #{x}."
puts "I also said: '#{y}'."

# assign the boolean false to the variable hilarious
hilarious = false
# assign the string below to the var joke evaluation
# hilarious is boolean, but since it is interpolated, "false" will be printed
# ruby calls .to_s on false (false.to_s = "false")
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

# print the joke evaluation string
puts joke_evaluation

# assign some more strings
w = "This is the left side of..."
e = "a string with a right side."

# concatenate them and print them
# extra credit 4: string concatenation joins strings w and e
puts w + e

# extra credit 2-3
# you liar. there are *6* instances of string interpolation.
# at least.
# i don't know if ruby reevaluates x when it puts (line 14) and when it interpolates it (line 19)

# UPDATE
# no it doesn't, (see line 17) otherwise the output for `puts y` and the interpolation of #{y} would have been different.

# so 6 places it is.
