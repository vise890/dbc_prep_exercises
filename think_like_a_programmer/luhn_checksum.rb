# 
class IDNumber

  def initialize(id_string)
    @id_string = id_string
  end

  # note. this reads one character at the time
  # i.e. i'm assuming that i don't have access to @id_string.length
  # this makes my life considerably harder
  # and code much more ugly
  # but apparently that's what c++ programmers like to do
  def checksum
    odd_length_checksum = 0
    even_length_checksum = 0
    length = nil

    @id_string.each_digit_with_position do |n, position|
      length = position
      if position.even?
        odd_length_checksum += double_digit_value(n)
        even_length_checksum += n
      else
        odd_length_checksum += n
        even_length_checksum += double_digit_value(n)
      end
    end

    length.odd? ? odd_length_checksum : even_length_checksum

  end

  def valid?
    self.checksum % 10 == 0
  end

  private

  # Returns the correct "doubled" value for n
  def double_digit_value(n)
    n *= 2
    # if a digit in the id sequence has to be doubled then
    # it may have 2 digits
    # if that is the case, we need to add the 2 digits separately
    if n >= 10
      # the first digit of n*2 is always one since 0 <= n <= 9
      # the second digit of n*2 is (n*2) % 10
      1 + (n % 10)
    else
      n
    end
  end

end

class String
  def each_digit_with_position(&block)
    position = 1
    self.each_char do |char|
      yield char.to_i, position
      position += 1
    end
  end
end

id = IDNumber.new('1762483')
puts id.checksum
puts id.valid?

id = IDNumber.new('123456690')
puts id.checksum
puts id.valid?
