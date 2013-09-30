# print a message about what you're going to do
puts "I will now count my chickens:"
# print Hens and then the result of the calculation. PEMDAS applies
puts "Hens", 25 + 30 / 6
# same as above, but with roosters and with a different calc. Note that the % returns an integer quotient
puts "Roosters", 100 -25 * 3 % 4

# he's now gonna count them eggs, print a message that explicits that intention
puts "Now I will count the eggs:"
# do the math. How many eggs do we have? 
puts 3.0 + 2.0 + 1.0 - 5.0 + 4.0 % 2.0 - 1.0 / 4.0 + 6.0

# again print a message about what we're going to do
puts "Is it true that 3 + 2 < 5 - 7?"
# and print the boolean value resulting from the calc. It's false because 5 > -2
puts 3 + 2 < 5 - 7


puts "What is 3 + 2?", 3 + 2
puts "What is 5 - 7?", 5 - 7

puts "Oh, that's why it's false."

puts "How about some more."

puts "Is it greater?", 5 > -2
puts "Is it greater or equal?", 5 >= -2
puts "Is it less or equal?", 5 <= -2
