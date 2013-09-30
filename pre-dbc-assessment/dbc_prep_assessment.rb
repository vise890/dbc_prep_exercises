#####################################################################
#####################################################################
# student: Martino Visintin (purple martins)
# email: vise890@gmail.com
#####################################################################
#####################################################################

#####################################################################
########################## EXERCISE 1 ###############################
#####################################################################

home_address = <<ADDRESS
Via Udine, 26
34170 - Lucinico
ADDRESS
home_city = 'Gorizia'
home_state = 'Italy'

#####################################################################
########################## EXERCISE 2 ###############################
#####################################################################

first_name = "Anne"
# store the value "Anne" in the variable `first_name`
# It's like putting "Anne" in a box labelled `first_name`
# so whenever you need it you can just use the label

first_name == "Anne" # => true
# checks that the contents of the box labelled `first_name`
# are the same as the value "Anne"
# tells you if that is true or false
# As of now, this is true. Because "Anne" is still in the box `first_name`
# so the expression becomes
# "Anne" == "Anne"
# and "Anne" is the same as "Anne"

# "Spalding" = first_name
# some nonsense. It's trying to put a box labelled `first_name`
# into the value `spalding`. As you can imagine,
# that doesn't work very well, Edward.
# we'll comment it out for the time being so my syntax checker doesn't
# yell at me.

"Spalding" == first_name # => false
# Checks that the value "Spalding" is the same as the contens of the box
# labelled `first_name`
# as of now (ignoring the "Spalding" = first_name nonsense), this is false
# the box`first_name` still contains "Anne"; so the expression becomes:
# "Spalding" == "Anne"
# which is not true (i.e. is false). "Spalding" is different than "Anne"

#####################################################################
########################## EXERCISE 3 ###############################
#####################################################################

ary = ["ruby", "is", "the", "best", "programming", "language", "ever"]

# the item stored at idx 3 is "best":
ary[3] # => "best"

# the index of the word "ruby" is 0
ary.index "ruby" # => 0

# the length of the array is 7
ary.length # => 7

#####################################################################
########################## EXERCISE 4 ###############################
#####################################################################

def product(ary)
  return nil if ary == []

  product = 1
  ary.each do |integer|
    product *= integer
  end

  return product
end

product([]) # => nil
product([0]) # => 0
product([0,0]) # => 0

product([1,2,3])    # => 6
product([0,-1,-10]) # => 0
product([1,-1,-10]) # => 10
# ahem... I sneakily corrected the last one. That's a 10. 10 should
# be the right return value for the method you asked for

#####################################################################
########################## EXERCISE 5 ###############################
#####################################################################

def product_odd(ary)
  return nil if ary == []

  # if all the elements are even, return nil
  # I don't know if that's the most sensible return value
  # but it shouldn't be 0 (nor 1..)
  return nil if ary.select { |i| i.even? } == ary

  product = 1
  ary.select { |i| i.odd? }.each do |integer|
    product *= integer
  end
  return product
end

product_odd([]) # => nil, because the array is ampty
product_odd([0]) # => nil, because all elements are even
product_odd([0,0]) # => nil, because all elements are even
product_odd([2,4,6]) # => nil, because all elements are even
product_odd([1,2,3])     # => 3, because 2 is even
product_odd([0,-1,-10])  # => -1, because 0 and -10 are even
product_odd([1,2,3,4,5]) # => 15, because 4 and 2 are even

#####################################################################
########################## EXERCISE 6 ###############################
#####################################################################

def fizzblam
  (1...1000).each do |number|
    if number % 35 == 0
      puts "FizzBlam" # I am "putsing" these instead of printing them as you asked. I hope that's cool
    elsif number % 7 == 0
      puts "Blam"
    elsif number % 5 == 0
      puts "Fizz"
    else
      puts number
    end
  end
end

#####################################################################
########################## EXERCISE 7 ###############################
#####################################################################

# METHOD 1
# returns the maximum integer in the array
# a shorter refactored version could be:
def max(ary)
  ary.max
end
# let's not break all the code that, I am sure,
# depends on good ol' method_1...
alias :method_1 :max

# METHOD 2
# returns all the positive (i.e. > 0) elements of the passed array
# Note: they're returned as an array.
# a shorter version could be:
def positive_integers_of(ary)
  ary.select { |n| n > 0 }
end

# METHOD 3
# returns all even elements of the passed array
# Note: they're returned as an array
# a shorter version could be:
def even_integers_of(ary)
  ary.select { |n| n.even? }
end

#####################################################################
########################## EXERCISE 8 ###############################
#####################################################################

# The difference between `puts` and `return`
#
# In short:
#   puts:
#     - prints something to the screen
#     - lets the program flow untouched
#     - it also adds a newline char at the end of what it puts (unlike print)
#     - puts (and print) *return* the value nil
#   return:
#     - doesn't print anything to the screen
#     - it just gives you a value
#     - it exits the function/method it's in (i.e., it alters the program's flow)

# But. Let's see some code:

(return 1) + (return 2) # => 3, same as 1 + 2

(puts 1) + (puts 2) # doesn't work
# this is what you'd see:
# 1
# 2
# NoMethodError:
# you can't call the `+` method on nil (nil doesn't have one)
# (remember, `nil` is what `puts 1` returns as a value)

#####################################################################
########################## EXERCISE 9 ###############################
#####################################################################

# Strategy:
# - make an array of numbers between 1 and 10,000
# - perform a set difference operation between that array and the one you gave me
# the result should be the missing number. that rascal

# Ruby Implementation:
def find_missing_number(ary)
  [(1..10000).to_a - ary].first
end
# note. I'm assuming you didn't lie and there's only *one* missing number
# time: 2m44s

#####################################################################
########################## EXERCISE 10 ##############################
#####################################################################

# ok there're a few things you didn't specify:
# - what kind of program is this? a full script? a class?
#   - i.e., "passed argument" is what?
# - how persistent is the grocery list? just as the life or the program? forever?
# - "pass the same argument twice"... as in:
# grocery_list 'chocholate', 'chocholate' # but you said pass in *an* item..
# OR
# grocery_list 'chocholate'
# grocery_list 'chocholate'

# So I'm gonna make these decisions:
# - it's a class
# - it just persists as long as the program lives
# - argument passed twice means two methods calls

# Pseudocode:
# class GroceryList:
#   method new:
#     grocery_list = Hash{ item => quantity }
#   method add_item(item):
#     grocery_list[item] +1

# Ruby Implementation
class GroceryList

  def initialize
    @list = Hash.new(0) # default value = 0
  end

  def add_item(item)
    @list[item] += 1
    return @list # you asked for the list to be returned?
  end

  def to_s
    str = ''
    @list.each do |item, quantity|
      str += "- #{quantity} x #{item}\n"
    end
    return str
  end
end

# There you go, your shiny new GroceryList:
# I packed some nice instructions on how to use it: (ok fine, you got me. it's my debug code)
shopping_list = GroceryList.new
shopping_list.add_item 'yak milk'
shopping_list.add_item 'eggs'
shopping_list.add_item 'eggs'
shopping_list.add_item 'kosong'
shopping_list.add_item 'nacho cheese'
puts shopping_list.to_s
# time 9m10s

#####################################################################
########################## EXERCISE 11 ##############################
#####################################################################

class House

  attr_reader :current_temperature
  def initialize(initial_temperature)
    @current_temperature = initial_temperature
    @heater_on = false
    @air_conditioner_on = false
  end

  def update_temperature!
    if heater_on?
      @current_temperature += 1
    elsif air_conditioner_on?
      @current_temperature -= 2
    end
    puts "Current temperature: #{@current_temperature}"
  end

  def heater_on?
    @heater_on
  end

  def air_conditioner_on?
    @air_conditioner_on
  end

  def switch_on_heater!
    # you didn't ask for it. but i refuse to have a house where the aircon and heater can both be on at the same time
    @air_conditioner_on = false

    @heater_on = true
  end

  def switch_on_air_conditioner!
    # same as above
    @heater_on = false

    @air_conditioner_on = true
  end

  def switch_off_heater!
    @heater_on = false
  end

  def switch_off_air_conditioner!
    @air_conditioner_on = false
  end

  def to_s
    str = "\n"
    str += "current temperature: #{@current_temperature}\n"
    str += "heater_on?: #{heater_on?}\n"
    str += "aircon_on?: #{air_conditioner_on?}\n"
    str += "\n"
    return str
  end

  def show_stats
    puts self.to_s
  end
end
# time: 8m22s

class SmartHouse < House
  def initialize(initial_temperature, min_temperature, max_temperature)
    super(initial_temperature)
    @min_temperature = min_temperature
    @max_temperature = max_temperature
  end

  def update_temperature!
    super
    if @current_temperature >= @max_temperature
      unless air_conditioner_on? # not needed in curr. implementation
        switch_on_air_conditioner!
        puts "Max temperature reached, I switched the aircon on"
      end
    elsif @current_temperature <= @min_temperature
      unless heater_on? # avoid duplicate messages
        switch_on_heater!
        puts "Min temperature reached, I switched the heater on"
      end
    end
  end
end
# time 5m12s

#####################################################################
########################## EXERCISE 12 ##############################
#####################################################################

# JS fiddle link:
# http://jsfiddle.net/vise890/88zTa/

#####################################################################
#####################################################################
########################## now napping .. ###########################
#####################################################################
