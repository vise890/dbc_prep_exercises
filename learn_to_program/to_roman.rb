class Integer
  def to_roman

    n = self
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
end

# testing 123 testing 123
puts 1.to_roman
puts 2.to_roman
puts 3.to_roman
puts 4.to_roman
puts 5.to_roman
puts 6.to_roman
puts 7.to_roman
puts 8.to_roman
puts 9.to_roman
puts 10.to_roman
puts 14.to_roman
puts 15.to_roman
puts 20.to_roman
puts 50.to_roman
puts 1005.to_roman
puts 105.to_roman
puts 900.to_roman
puts 999.to_roman
puts 10000.to_roman
