$nesting_depth = 0

def log block_description, &block
  indent = "\t" * $nesting_depth
  puts indent + "Commencing \"#{block_description}\""
  $nesting_depth += 1
  block_return_value = yield
  puts indent + "\"#{block_description}\" has finished, returning:"
  puts indent + block_return_value
  puts
end

log 'outer block' do
  log 'middle block' do
    log 'innest block' do
      'Look how *in* I am'
    end
    'In medio stat virtus'
  end
  'I am the outest, baddest block in town'
end
