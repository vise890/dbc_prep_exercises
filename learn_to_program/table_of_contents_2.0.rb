page_width = 50
toc = [
  [1, 'Getting Started', 1],
  [2, 'Numbers', 9],
  [3, 'Letters', 13]
]

puts 'Table of Contents'.center(page_width)

toc.each do |chapter_ary|
  puts "Chapter #{chapter_ary[0]}:  #{chapter_ary[1]}".ljust(page_width * 2/3) +
       "page #{chapter_ary[2]}".rjust(page_width * 1/3)
end
