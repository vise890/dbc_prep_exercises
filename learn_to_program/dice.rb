
class Die

  attr_reader :showing

  def initialize
    roll
  end

  def roll
    @showing = rand 1..6
  end

  def cheat n
    raise ArgumentError if n < 0 || n > 6
    @showing = n
  end
end

# 10.times { puts Die.new.roll }
