class RPNCalculator
  # Define your methods, here!
  def evaluate(str)
    input_tokens = str.split(' ')
    stack = []
    while input_tokens.length > 0
      e = input_tokens.shift
      if e == '+'
        stack << add(stack.pop(2))
      elsif e == '-'
        stack << subtract(stack.pop(2))
      elsif e == '*'
        stack << multiply(stack.pop(2))
      else # e is a value
        stack << e.to_f
      end
    end
    
    if stack.length == 1
      return stack.first
    else
      raise 'User input has too many values'
    end
    
  end
  
  private
  
  def add(ary)
    ary[0] + ary[1]
  end
  
  def subtract(ary)
    ary[0] - ary [1]  
  end
  
  def multiply(ary)
    ary[0] * ary[1]
  end
  
end

