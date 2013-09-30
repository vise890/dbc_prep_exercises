def flatten(array)
  if array == []
    # 3. Base case two; avoid empty arrays to be parsed recursively yet again
    #    (that would add `nil`s, as that's what [][any_index] returns)
    #    NOTES:
    #     - since [] is technically an Array, this branch needs to be at
    #       the before the next (in the current implementation) to avoid triggering
    #       of recursive step
    #     - return an empty array so concatenation doesn't choke
    #     - [] is what is returned by ary[1..-1] if ary has *only* one element
    #       cool stuff. it usually returns nil...
    []
  elsif array.is_a? Array
    # 1. Recursive Step: assume flatten works for smaller inputs
    #    SO:
    #     - just break the input down into two more digestible chunks
    #     - concatenate the flattened versions and return
    #     - again. just assume it works martino. do not try to think
    #       this through. it works.
    #     - only thing that maybe you should think about is that array[0]
    #       has the *potential* to yield a simple item
    flatten(array[0]) + flatten(array[1..-1])
  else
    # 2. Base case, array is just an element
    #    NOTES:
    #     - if it's an element, it can just be concatenated as is
    #     - return it wrapped in an ary so that the recursive step above
    #       does not choke
    [array]
  end
end

#### TESTING ####
require 'rspec'

describe 'flatten(ary)' do

  it 'should leave ary unchanged if it is already flat' do
    ary = [1,2,3]
    ary.should == flatten(ary)
  end

  it 'should remove [] wraps around an ary' do
    ary = [[[[[1, 2]]]]]
    flatten(ary).should == [1, 2]
  end

  it 'should flatten a relatively complex array' do
    ary = [1, 2, :foo, :bar, true, [nil, :foo, [], [1, 2, 3]]]
    flatten(ary).should == [1, 2, :foo, :bar, true, nil, :foo, 1, 2, 3]
  end

  it 'shoud not operate distructively' do
    ary = [1, 2, :foo, :bar, true, [nil, :foo, [], [1, 2, 3]]]
    flatten(ary)
    ary.should == ary
  end

end
