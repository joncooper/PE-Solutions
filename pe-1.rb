#
# Project Euler #1
#
# Add all the natural numbers <1000 that are multiples of 3 or 5
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6, and 9. 
# The sum of these multiples is 23.

sum = 0
(1..999).each do |i|
  sum += i if ((i % 3) == 0) or ((i % 5) == 0) 
end
puts sum

# Alternately, a slightly manky one-liner
#
# puts (1..999).inject { |sum, i| (((i % 3) == 0) or ((i % 5) == 0)) ? sum + i : sum }