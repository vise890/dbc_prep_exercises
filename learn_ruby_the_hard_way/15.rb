# assign the first argument to the filename variable
filename = ARGV.first

# assign a prompt string to a variable
prompt = "> "

# I guess this creates a new instance of File, initializing it with
# the file specified in the argument (filename)
# this object is now assigned to the `txt` variable
txt = File.open filename

# Puts an instruction string with filename; boring stuff
puts "Here's your file: #{filename}"
# call the read method on the txt object. That returns the raw content of
# the file apparently
# print the returned value (i.e. the contents of the file)
puts txt.read

# same sheit.
puts "I'll also ask you to type it again:"
# print the prompt string
print prompt
# meh. this should really be called 'filename_again' to be precise
# just get it from the user input and chomp it
file_again = STDIN.gets.chomp

# same biz, new instance of File
txt_again = File.open file_again

# aaand, as before, print the output of
# txt_agan.read (i.e. the #read method called on the instance of File)
puts txt_again.read
