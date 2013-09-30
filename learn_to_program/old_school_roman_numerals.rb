def to_roman n
  raise ArgumentError if !n.is_a? Integer

  roman_numeral = ''

  roman_conversion_table = {
    1000 =>  'M',
    500  =>  'D',
    100  =>  'C',
    50   =>  'L',
    10   =>  'X',
    5    =>  'V',
    1    =>  'I'
  }

  roman_conversion_table.each do |arabic_value, roman_representation|
    roman_numeral += roman_representation * (n/arabic_value)
    n = n % arabic_value
  end

  return roman_numeral
end

# testing 123 testing 123
puts to_roman 1
puts to_roman 2
puts to_roman 3
puts to_roman 4
puts to_roman 5
puts to_roman 6
puts to_roman 7
puts to_roman 8
puts to_roman 9
puts to_roman 10
puts to_roman 14
puts to_roman 15
puts to_roman 20
puts to_roman 50
puts to_roman 1005
puts to_roman 105
puts to_roman 900
puts to_roman 999
puts to_roman 10000
puts to_roman 11000
