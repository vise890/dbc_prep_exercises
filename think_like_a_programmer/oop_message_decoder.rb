class EncodedMessage

  def initialize(message)
    @message = message.split(',').map { |token| token.to_i }
    @current_mode = :upcase
  end

  def decode
    decoded_message = []
    self.each_token do |token|
      decoded_message << decode_token(token)
    end

    return decoded_message.join
  end

  def each_token(&block)
    @message.each do |token|
      yield token
    end
  end

  private

  def decode_token(token)
    n = token % current_divisor
    if n == 0
      switch_current_mode!
    else
      case @current_mode
      when :upcase then n_to_letter(n).upcase
      when :downcase then n_to_letter(n).downcase
      when :punctuation then n_to_punctuation(n)
      end
    end
  end

  def n_to_letter(n)
    letter_conversion_table = {
      1  => 'a',
      2  => 'b',
      3  => 'c',
      4  => 'd',
      5  => 'e',
      6  => 'f',
      7  => 'g',
      8  => 'h',
      9  => 'i',
      10 => 'j',
      11 => 'k',
      12 => 'l',
      13 => 'm',
      14 => 'n',
      15 => 'o',
      16 => 'p',
      17 => 'q',
      18 => 'r',
      19 => 's',
      20 => 't',
      21 => 'u',
      22 => 'v',
      23 => 'w',
      24 => 'x',
      25 => 'y',
      26 => 'z',
    }

    letter_conversion_table[n]
  end

  def n_to_punctuation(n)
    punctuation_conversion_table = {
      1 => '!',
      2 => '?',
      3 => ',',
      4 => '.',
      5 => ' ',
      6 => ';',
      7 => '"',
      8 => '\'',
    }

    punctuation_conversion_table[n]
  end

  def current_divisor
    case @current_mode
    when :upcase, :downcase then 27
    when :punctuation then 9
    end
  end

  def switch_current_mode!
    case @current_mode
    when :upcase
      @current_mode = :downcase
    when :downcase
      @current_mode = :punctuation
    when :punctuation
      @current_mode = :upcase
    end
    return nil
  end

end

msg = EncodedMessage.new('18,12312,171,763,98423,1208,216,11,500,18,241,0,32,20620,27,10')
puts msg.decode
