# PE#20
# Find the sum of digits in the number 100!

require 'pe-library'

def factorial(x)
  return x.downto(2).inject(1) { |product, x| product *= x }
end

puts factorial(100).to_s.chars.map(&:to_i).sum