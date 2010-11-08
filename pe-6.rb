# PE#6
#
# The sum of squares of the first 10 natural numbers is 1**2 + 2**2 + ... + 10**2 = 385
# The square of the sum of the first 10 is          (1 + 2 + ... + 10)**2 = 55**2 = 3025
# Hence the difference is 3025 - 385 = 2640
#
# Find the difference between the sum of the squares of the first 100 natural numbers
# and the square of the sum.

require 'pe-library'

sum_of_squares = (1..100).inject { |sum, x| sum + x**2 }
square_of_sum = Array(1..100).sum ** 2

puts square_of_sum - sum_of_squares