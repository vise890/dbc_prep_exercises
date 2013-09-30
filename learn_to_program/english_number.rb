def english_number(n)
  raise ArgumentError.new('Input must be an integer') unless n.is_a? Integer
  raise ArgumentError.new('Input must be >= 0') if n < 0

  return 'zero' if n == 0

  conversion_table = {
    10000000000000 => 'trillion',
    1000000000 => 'billion',
    1000000    => 'million',
    1000       => 'thousand',
    100        => 'hundred',
    90         => 'ninety',
    80         => 'eighty',
    70         => 'seventy',
    60         => 'sixty',
    50         => 'fifty',
    40         => 'fourty',
    30         => 'thirty',
    20         => 'twenty',
    19         => 'nineteen',
    18         => 'eighteen',
    17         => 'seventeen',
    16         => 'sixteen',
    15         => 'fifteen',
    14         => 'fourteen',
    13         => 'thirteen',
    12         => 'twelve',
    11         => 'eleven',
    10         => 'ten',
    9          => 'nine',
    8          => 'eight',
    7          => 'seven',
    6          => 'six',
    5          => 'five',
    4          => 'four',
    3          => 'three',
    2          => 'two',
    1          => 'one',
  }

  english_version = []

  conversion_table.each do |integer, english|

    quotient = n / integer

    if quotient == 1
      prefix = 'one ' if integer >= 100 # only want "one hundred", "one thousand", etc.; NOT "one thirty", "one six", "one one", etc.
      english_version << prefix.to_s + english
    elsif quotient > 1
      english_version << english_number(quotient) + '-' + english
    end
    n %= integer if quotient > 0

  end

  return english_version.join '-'

end


# testing...
puts english_number(0)
puts english_number(9)
puts english_number(10)
puts english_number(11)
puts english_number(17)
puts english_number(32)
puts english_number(88)
puts english_number(99)
puts english_number(100)

puts english_number(101)
puts english_number(234)
puts english_number(3211)
puts english_number(999999)
puts english_number(1000000000000)
# puts english_number(-1)
# puts english_number('a')
