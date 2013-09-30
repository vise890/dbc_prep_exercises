class RPNCalculator

  def evaluate(input_tokens)
    input_tokens = input_tokens.split(' ') if input_tokens.is_a? String
    wrapped_evaluate(input_tokens)
  end

  private

  def wrapped_evaluate(input_tokens, stack = [])

    if input_tokens.empty?
      # there's no more input to parse, return result
      raise ArgumentError if stack.length != 1
      return stack.first
    else

      # there's still input left
      token = input_tokens.shift

      case token
      when '+'
        stack.push(stack.pop + stack.pop)
      when '-'
        stack.push(-(stack.pop - stack.pop))
      when '*'
        stack.push(stack.pop * stack.pop)
      when '/'
        quot = stack[-2] / stack[-1]
        stack.pop(2)
        stack.push(quot)
      else # token is a value
        stack.push token.to_f
      end

      return wrapped_evaluate(input_tokens, stack)
      # note that input tokens has been reduced by one
      # and stack has been updated

    end

  end

end

# testing
# puts RPNCalculator.new.evaluate('10 2 3 + + 5 /')
require 'rspec'

describe RPNCalculator do
  let(:rpn) { RPNCalculator.new }

  describe '#evaluate' do
    it "expects 1 argument" do
      RPNCalculator.instance_method(:evaluate).arity.should eq 1
    end

    it "correctly evaluates '0'" do
      rpn.evaluate('0').should be_zero
    end

    it "correctly evaluates '-1'" do
      rpn.evaluate('-1').should == -1
    end

    it "correctly handles addition" do
      rpn.evaluate('4 4 +').should eq (4 + 4)
    end

    it "correctly handles addition of -ve numbers" do
      rpn.evaluate('2 -4 +').should == -2
    end

    it "correctly handles multiplication" do
      rpn.evaluate('4 6 *').should eq (4 * 6)
    end

    it "correctly handles subtraction" do
      rpn.evaluate('4 30 -').should eq (4 - 30)
    end

    it "handles multiple operators in a row" do
      rpn.evaluate('1 2 3 4 + + +').should eq (1 + 2 + 3 + 4)
    end

    it "correctly combines addition and multiplication" do
      rpn.evaluate('1 2 + 3 4 + *').should eq ((2 + 1) * (4 + 3))
    end

    it "correctly combines multiplication, addition, and subtraction" do
      rpn.evaluate('20 10 5 4 + * -').should eq (20 - 10*(5 + 4))
    end

    it "handles arbitrary input" do
      a, b, c = Array.new(3) { rand(100) }

      rpn.evaluate("#{a} #{b} - #{c} *").should eq (a-b)*c
    end

    it 'handles the Porter Conundrums' do
      rpn.evaluate('10 2 3 + + 5 /').should == 3
      rpn.evaluate('10 2 3 + + 5 -').should == 10
      expect { rpn.evaluate('2 3 1 + 1 -')}.to raise_error
    end

    it 'should raise an exception for invalid input' do
      expect { rpn.evaluate('2 3 1 + 1 /') }.to raise_error
    end

  end

end
