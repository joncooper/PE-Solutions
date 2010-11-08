# PE#14
# The following iterative sequence is defined for the set of positive integers:
#
#   n -> n/2    (n is even)
#   n -> 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
#   13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

require 'pe-library'

def next_collatz(seed)
  if seed.even?
    seed / 2
  else
    (3 * seed) + 1
  end
end

@cache = {}
@cache[1] = 0

def find_collatz_steps(seed)
  unless @cache.has_key? seed
    @cache[seed] = 1 + find_collatz_steps(next_collatz(seed))
  end
  return @cache[seed]
end

max = 0
max_seed = 1

(1..1000000).each do |seed|
  steps = find_collatz_steps(seed)
  if steps > max
    max = steps
    max_seed = seed
  end
  if (seed % 5000 == 0)
    puts seed
  end
end

puts max_seed
puts max

# 837799, 524 steps
# You need to cache the series. Because any time you hit a number you've already calculated the series for, you're done.
# Duh.