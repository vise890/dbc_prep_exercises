def mode(array)
  frequency_table = Hash.new(0) # frequency table is a Hash with a default value of 0 for new keys
  
  array.each do |e|
    frequency_table[e] += 1 # increase the frequency by one. The number is the key and the frequency is the value
  end
  
  # sort the frequency table by frequency and reverse it (we want it from biggest to smallest)
  sorted_frequency_table = frequency_table.sort_by { |e, frequency| frequency }.reverse
  
  # prepare the result array
  result = []
  
  # traverse the sorted freq table
  sorted_frequency_table.each_with_index do |e, idx|
    
    frequency_of_e = e[1] # the frequency of the current element
    next_frequency = sorted_frequency_table[idx+1][1] # the frequency of the next element
    
    if frequency_of_e == next_frequency # if the two are the same
      result << e[0] # push this number in the results array
    elsif frequency_of_e > next_frequency # if the current frequency is bigger than the next
      result << e[0] # push the freq in result
      break # need to break (next doesnt belong to result)
    end
    
  end
    
  return result.sort # sort to fix analities of RSpec 
end

