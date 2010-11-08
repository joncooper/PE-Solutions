# PE#30
#
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
# 
# 1634 = 1**4 + 6**4 + 3**4 + 4**4
# 8208 = 8**4 + 2**4 + 0**4 + 8**4
# 9474 = 9**4 + 4**4 + 7**4 + 4**4
# As 1 = 1**4 is not a sum it is not included.
# 
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

require 'benchmark'
require 'rubygems'
require 'combinatorics'

def l
  load 'pe-30.rb'
end

def fpod_sum(i)
  digits = i.to_s.chars.map(&:to_i)
  return digits.inject(0) { |sum, digit| sum += (digit ** 5) }
end

# By experiment (i.e. choosing a very large upper bound, bruteforcing, summing the first n results that occur in a 
# reasonable amount of time, and trying it on PE), the answer set is:
# [4150, 4151, 54748, 92727, 93084, 194979]
#
# Contritely, find an upper bound.
#  len 1 can contain only 1 or 0
#  len 2 can contain only 2 or 1 or 0
#  len 3 can contain only 3 or 2 or 1 or 0
#  len 4 can contain only (0..6) 
#  len 5 can contain only (0..9)
#  len 6 can contain (0..9) but must contain at least 1 9 (since the total of fpod_sum for 0..8 is < fpod_sum 9)
#  len 7 isn't possible because the max value per digit is 9**5 == 59049 and 7*59049 == 413343 which is only 6 digits.

p Benchmark.measure {
  (2..10**6).each do |x|
    sum = fpod_sum(x)
    puts "#{x}: #{sum}" if sum == x
  end
}