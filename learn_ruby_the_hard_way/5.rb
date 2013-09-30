name = 'Zed A. Shaw'
age = 35 # not a lie
height = 74 # inches
weight = 180 # lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'

puts "Let's talk about %s." % name
puts "He's %d inches tall." % height
puts "He's %d pounds heavy." % weight
puts "Actually that's not too heavy."
puts "He's got %s eyes and %s hair." % [eyes, hair]
puts "His teeth are usually %s depending on the coffee." % teeth

# this line is tricky, try to get it exactly right
puts "If I add %d, %d, and %d I get %d." % [age, height, weight, age + height + weight]


puts "\n"
# metric magic
si_height = height * 0.0254
si_weight = weight * 0.453592

puts "Let's be sensible now, let's use the metric system. As we should."
puts "He's #{si_height} metres tall."
puts "He weighs #{si_weight} kilograms."
puts "Aaaaah, much better."

# if you want all of the format sequences, here they are:
# http://ruby-doc.org/core-2.0/Kernel.html#method-i-format

