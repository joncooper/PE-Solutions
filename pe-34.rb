# PE#34
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require 'pe-library'
require 'benchmark'
require 'memoize'
include Memoize

def sum_digits_factorial(i)
  return i.to_s.chars.map(&:to_i).inject(0) { |sum, digit| sum += factorial(digit) }
end

def is_curious_number? (i)
  return i == sum_digits_factorial(i)
end

# >> (1..9).each { |i| m[i] = factorial(i) }
# => [[1, 1], [2, 2], [3, 6], [4, 24], [5, 120], [6, 720], [7, 5040], [8, 40320], [9, 362880]]

# How can I combine these in ways that result in the right order of magnitude?
#
# 2 oom = any of [1,2,3,4]
# 3 oom = any of [1,2,3,4,5] plus {0, 1} 6's
# 4 oom = any of [1,2,3,4,5,6] plus {0, 1} 7's
# 5 oom = any of [1,2,3,4,5,6,7] plus {0, 1, 2} 8's
# 6 oom = any of [1,2,3,4,5,6,7,8] plus {0, 1, 2} 9's
# 7 oom = any of [1,2,3,4,5,6,7, 8, 9] with max of all 9's = 2,540,160
# 8 oom = inexpressible, since 8 9's produces only 2,265,920
# ... the rest are inexpressible as well, since adding a digit gets us at most 362,880 added to the sum but another oom to x.

upper_bound = 2_540_160
@search_range = (3..upper_bound)

def go
  p Benchmark.measure { 
    curious_numbers = @search_range.to_a.find_all { |i| is_curious_number? i }
    p curious_numbers
  }
end

go