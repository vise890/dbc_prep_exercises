def valid_triangle?(a,b,c)
  [a,b,c].all? { |s| s > 0 } && [a,b,c].sort[0..1].inject(:+) > [a,b,c].sort[2]
end

def valid_triangle?(a,b,c)
  (a + b + c > 0) && (a + b > c) && (b + c > a) && (c + a > b)
end
