def decode_message(str)
  tokens = []
  while 
    n = 0
    if char != ','
      n = n * 10 + char.to_i
      tokens << n
    end
  end
  return tokens
end

puts decode_message('18,12312,171,763,98423,1208,216,11,500,18,241,0,32,20620,27,10')

