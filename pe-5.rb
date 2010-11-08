# Project Euler #5
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20

require 'pe-library'
require 'mathn'

# Build a small prime table

prime_generator = Prime.new
prime_table = (1..20).collect { prime_generator.next }
prime_table = prime_table.select { |p| p < 20 and p > 10 }
puts prime_table.inspect

(1..20).each do |x|
  factorization = factor(x)
  
end

# Use standardized test type divisibility tests

# x It's divisible by 2 so the last digit is {0, 2, 4, 6, 8}
# x It's divisible by 3 so the sum of digits is divisible by 3
# x It's divisible by 4 so the last two digits are divisible by 4
# x It's divisible by 5 so the last digit is {0, 5}
# x It's divisible by 6 so it's divisible by 2 and 3
# x It's divisible by 7
# x It's divisible by 8 so the last three digits are divisible by 8
# x It's divisible by 9 so the sum of digits is divisible by 9
# x It's divisible by 10 so the last digit is 0

def test_1_to_10_divisibility(n)
  digits = n.to_s.chars.map(&:to_i)
  case 
  when digits[-1] != 0 then return false
  when digits.sum % 3 != 0 then return false
  when digits.sum % 9 != 0 then return false
  when n % 4 != 0 then return false
  when n % 8 != 0 then return false
  when n % 7 != 0 then return false
  end
  return true
end

# 1  1
# 2  2
# 3  3
# 4  2 * 2
# 5  5
# 6  2 * 3
# 7  7
# 8  2 * 2 * 2
# 9  3 * 3
# 10 2 * 5
# 11 11
# 12 2 * 2 * 3
# 13 13
# 14 2 * 7
# 15 3 * 5
# 16 2 * 2 * 2 * 2
# 17 17
# 18 2 * 3 * 3
# 19 19
# 20 2 * 2 * 5
#
# Choose the largest exponent for each prime and then multiply.
# Hence, by arithmetic, answer = 2**4 * 3**2 * 5 * 7 * 11 * 13 * 17 * 19

# Someone's very clever stdlib using LCM approach:
# 
# require 'rational'
# num = (1..20).inject(1) { |result, n| result.lcm n }
# puts "Smallest evenly divisible number is #{ num }."
