# EXTRA CREDIT

## 1 ##
# require loads and runs an external file. It won't do it twice
# Include is a ruby language construct to mix in modules in classes (kinda)

## 2 ##
# of course, you could require a file that has cnstants defined in it for example

## 3 ##
# when 'requiring' a file, ruby looks into all the places listed in $LOAD_PATH, which is implementation and system dependent
# run ruby -e 'puts $:' to print them
# note $: is the same env variable as $LOAD_PATH
# also `ruby -e` makes ruby evaluate the argument
# in my system the paths that are searched are:
#/usr/local/lib/site_ruby/1.9.1
#/usr/local/lib/site_ruby/1.9.1/x86_64-linux
#/usr/local/lib/site_ruby
#/usr/lib/ruby/vendor_ruby/1.9.1
#/usr/lib/ruby/vendor_ruby/1.9.1/x86_64-linux
#/usr/lib/ruby/vendor_ruby
#/usr/lib/ruby/1.9.1
#/usr/lib/ruby/1.9.1/x86_64-linux

require 'open-uri'

open("http://www.ruby-lang.org/en") do |f|
  f.each_line { |line| p line }
  puts f.base_uri
  puts f.content_type
  puts f.charset
  puts f.content_encoding
  puts f.last_modified
end
