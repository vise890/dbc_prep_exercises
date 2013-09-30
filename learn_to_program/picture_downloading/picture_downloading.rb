# Ask for a batch name
puts 'Enter a name for this batch of pictures:'
batch_name = gets.chomp


# Now moving into picture inbox
Dir.chdir './picture_inbox'

# Generate a list of pictures
pic_list = Dir['../camera/*.{JPG,jpg}']

puts "Downloading #{pic_list.length} pictures form camera"

pic_list.each_with_index do |pic_path, n|
  print '.'
  new_name = if n+1 < 10
               "#{batch_name}-0#{n+1}.jpg"
             else
               "#{batch_name}-#{n+1}.jpg"
             end
  File.rename pic_path, new_name unless Dir[new_name] != [] # do not overwrite
end

puts 'All done!'
