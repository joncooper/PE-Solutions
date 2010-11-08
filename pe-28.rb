# PE#28
#
# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
# 
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
# 
# It can be verified that the sum of the numbers on the diagonals is 101.
# 
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

# [1] 
# 2 [3] 4 [5] 6 [7] 8 [9] 
# 10 11 12 [13] 14 15 16 [17] 18 19 20 [21] 22 23 24 [25] 
# 26 27 28 29 30 [31] 32 33 34 35 36 [37] 38 39 40 41 42 [43] 44 45 46 47 48 [49]

require 'benchmark'

def l
  load 'pe-28.rb'
end

# Or, the easy way.
# You can count and sum each i'th element where i is the side width.

def spiral_corner_sum(size)
  return 1 if size == 1
  
  step         = size - 1
  top_right    = size ** 2
  top_left     = top_right   - step
  bottom_left  = top_left    - step
  bottom_right = bottom_left - step
  
  return top_right + top_left + bottom_left + bottom_right
end

p Benchmark.measure { p (1..1001).step(2).to_a.inject { |sum, size| sum += spiral_corner_sum(size) } }

