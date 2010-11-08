# PE#36
#
# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)

require 'pe-library'
require 'benchmark'

def to_binary(i)
  return i.to_s(2)
end

p Benchmark.measure {
  upper_bound  = 1_000_000
  search_range = (1..upper_bound)

  results = search_range.to_a.find_all do |i|
    i_s         = i.to_s
    i_binary_s  = i.to_s(2)
    i_s == i_s.reverse and i_binary_s == i_binary_s.reverse
  end

  p results
  p results.sum
}