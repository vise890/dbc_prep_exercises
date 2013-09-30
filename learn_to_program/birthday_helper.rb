def birthday_helper

  puts "Whose bday do you wanna know?"
  required_name = gets.chomp.capitalize

  db = File.open 'birthday_helper.txt', 'r'

  db.each_line do |person|
    person = person.chomp.split ','
    name = person[0].chomp.capitalize

    if name == required_name
      birthday = person[1].split '/'
      birthday = Time.new birthday[0], birthday[1], birthday[2]

      age = ((Time.now - birthday) / (60*60*24*365)).to_i

      puts
      puts "#{name}'s birthday is: #{birthday}"
      puts "Their current age is #{age}"
    end

  end
end

birthday_helper
