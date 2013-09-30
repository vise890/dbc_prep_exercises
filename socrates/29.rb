class Array
  def fooey
    puts self
  end
  
  def pad!(min_size, value = nil)
    if self.length < min_size
      pad_size = min_size - self.length
      pad_size.times do
        self.push value
      end
      return self
    else
      return self
    end
  end
  
  def pad(min_size, value = nil)
    copy = self.dup
    copy.pad!(min_size, value)
  end
end
