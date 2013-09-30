def recursive_is_palindrome?(str)
  if str.length == 0
    return true
  else
    return (str[0] == str[-1] && is_palindrome?(str[1..-2]))
  end
end

def is_palindrome?(str)
  str == str.reverse
end

largest_palindrome_product = 0
(100...999).each do |j|
  (100...999).each do |k|
    product = j * k
    if (is_palindrome?(product.to_s) && product > largest_palindrome_product)
      largest_palindrome_product = product
    end
  end
end
puts largest_palindrome_product
