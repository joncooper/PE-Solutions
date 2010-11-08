# PE#24
#
# A permutation is an ordered arrangement of objects. 
# For example, 3124 is one possible permutation of the elements 1, 2, 3 and 4. 
# If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. 
#
# The lexicographic permutations of 0, 1 and 2 are:
#   012   021   102   120   201   210
# 
# What is the millionth lexicographic permutation of the elements 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

require 'benchmark'
require 'pe-library'

# Here is a minging, slow, brute-force implementation
# 
# permutations = (0..9).to_a.permutation(10).to_a.map do |permutation_as_array|
#   permutation_as_array.map(&:to_s).join("")
# end
# 
# p permutations[999999]
# "2783915460"

# Now try it in a less grody way.
# Like directly computing the n'th lexicographic permutation, say. 

def nth_permutation(n, elements)
  # Boundary condition
  return elements[0] if elements.length == 1
  # Recur
  row_step = factorial(elements.length - 1)
  element = elements[n.fdiv(row_step).truncate % elements.length]
  remaining_elements = elements - [element]
  return [element, nth_permutation(n % row_step, remaining_elements)].flatten
end

puts nth_permutation(999999, (0..9).to_a).map(&:to_s).join