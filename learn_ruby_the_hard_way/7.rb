# really for fux sake. ok here we go
# prints the string and goes to a new line
puts "Mary had a little lamb."

# prints the string, substituting %s with 'snow'.to_s
puts "Its fleece was white as %s." % 'snow'
# prints another boring string and returns
puts "And everywhere that Mary went."
# prints 10 dots and returns
puts "." * 10 # what'd that do? # Answer: put 10 dots

# assign a bunch of variables
# will we concatenate them to form the word "CheeseBurger" later, I wonder? ...
end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

# notice how we are using print instead of puts here. change it to puts
# and see what happens.

# ah there it is, called it
# print the concatenation of end(1-6) variables; NO return (using print)
print end1 + end2 + end3 + end4 + end5 + end6
# same as above, but for vars end(7-12), again NO return at the end
print end7 + end8 + end9 + end10 + end11 + end12

# changing these to puts prints 'Cheese' on one line, and 'Burger' on the next
# basically puts adds a lne break at the end of the string it pritgs
# puts str <==> print str + " \n" (without the space before \n) but it doesn't work without the space for some reason. INVESTIGATE

# this is just polite use of the terminal, try removing it
puts # just return so that the last line is clean (i.e. no '%' or prompt straight after the string)
