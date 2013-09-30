def to_roman n
  raise ArgumentError if !n.is_a? Integer

  roman_numeral = ''

  roman_conversion_table = {
    1000 =>  'M',
    900  =>  'CM',
    500  =>  'D',
    400  =>  'CD',
    100  =>  'C',
    90   =>  'XC',
    50   =>  'L',
    40   =>  'XL',
    10   =>  'X',
    9    =>  'IX',
    5    =>  'V',
    4    =>  'IV',
    1    =>  'I',
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

# ~~THIS IS WRONG~~
# ~~999 should be "IM"~~

# ... Actually no... Chris Pine is wrong.
# The small value has to be at least 1/10th of the big one for the subtractive trick.
# Therefore the only shorthands are 900, 400, 90, 40, 9 and 4
# so my algo is correct, not to mention pretty as fuck 8)
