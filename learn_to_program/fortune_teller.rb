puts 'I am a fortune-teller.  Tell me your name:'
name = gets.chomp

lucky_people = %w(rod mcsteel)

if lucky_people.include? name
  puts 'I see great things in your future.'
else
  puts 'YOur future is...oh my!  Look at the time!'
  puts 'I really have to go, sorry!'
end
