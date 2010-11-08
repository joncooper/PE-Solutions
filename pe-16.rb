# PE#16
# Sum the digits of 2**1000

puts (2**1000).to_s.chars.map(&:to_i).inject { |sum, x| sum + x }