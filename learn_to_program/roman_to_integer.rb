def roman_to_integer roman_str

  return nil if roman_str == ''

  # Q: is this fair use of a Hash (reliying on order)
  conversion_table = {
    'i'  => 1,
    'vi' => 4,
    'v'  => 5,
    'xi' => 9,
    'x'  => 10,
    'lx' => 40,
    'l'  => 50,
    'cx' => 90,
    'c'  => 100,
    'dc' => 400,
    'd'  => 500,
    'mc' => 900,
    'm'  => 1000,
  }

  roman_str = roman_str.reverse
  converted_integer = 0

  conversion_table.each do |roman, integer|
    while roman_str.match (/^#{roman}/)
      converted_integer += integer
      roman_str.sub!(roman, '')
    end
  end

  if roman_str != ''
    puts 'Ivalid input'
  else
    return converted_integer
  end
end

# testing
puts roman_to_integer 'mcmxcix'
puts roman_to_integer 'i'
puts roman_to_integer 'ii'
puts roman_to_integer 'iii'
puts roman_to_integer 'iv'
puts roman_to_integer 'mcc'
puts roman_to_integer 'mccc'
puts roman_to_integer 'mcd'
puts roman_to_integer 'iiv'
