Dir.chdir './camera'

file_extensions = %w(jpg JPG avi mov doc foo txt)

10000.times do 
  file_extension = file_extensions.sample
  file_name = "#{rand(0..100000)}.#{file_extension}"
  File.open file_name, 'w'
end
