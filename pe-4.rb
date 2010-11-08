#
# Project Euler #4
#
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#

require 'pe-library'

# Well, the largest number you can make out of two 3 digit numbers is

max_possible = 999 * 999

# And the smallest you can make is 

min_possible = 100 * 100

# The total number of possible palindromic numbers is
#
# Max = 998001
# [1..9] * [1..9] * [1..7]

max_fragment = Integer(10 ** (Math.log10(max_possible) / 2))
min_fragment = 10 ** (Math.log10(max_possible) / 2).floor

def find_three_digit_pairs(candidate)
  Math.sqrt(candidate).round.downto(100) do |divisor|
    result = candidate / Float(divisor)
    decimal_part = result - result.truncate
    next if decimal_part != 0
    integer_part = result - decimal_part
    puts "#{candidate}: #{divisor} * #{Integer(integer_part)}" if Math.log10(integer_part).truncate == 2
  end
end

max_fragment.downto(min_fragment) do |fragment|
  # Wow, that's heinous
  palindrome = Integer(String(fragment) + String(fragment).reverse)
  find_three_digit_pairs(palindrome)
end
