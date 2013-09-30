class OrangeTree

  attr_reader :height, :oranges, :age

  def initialize
    @height = 0
    @oranges = 0
    @age = 0
  end

  def one_year_passes
    @height += 1 # Height expressed in international orange-tree-talness units
    @age += 1
    @oranges = (@height * 0.5).to_i
    self
  end

  def count_oranges
    @oranges
  end

  def pick_orange
    if @oranges >= 1
      @oranges -= 1
      'Hmm, that\'s a tasty orange; Do you mind if I have some of your beverage to wash it down?'
    else
      'No more oranges, yo. Just wait?'
    end
  end

end

# Make this interactive
# I don't want a dragon.
# It would be the same tho
# In fact I'll make it so general, it will make any class interactive
# Boom
#

class DispatchOMatic

  def initialize(klass)
    @obj = (Module.const_get(klass)).new
  end

  def start
    input = nil
    while input != 'quit'
      input = gets.chomp.downcase
      puts @obj.send(input.to_sym)
    end
  end

end

