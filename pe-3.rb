# Project Euler #3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
#

require 'pe-library'

to_factor = 600851475143

highest_possible_factor = Math.sqrt(to_factor)
factors = []
if ((to_factor % 2) == 0)
  factors << 2
end
(3..highest_possible_factor).step(2) do |possible_factor|
  if ((to_factor % possible_factor) == 0)
    is_composite = false
    factors.each do |existing_factor|
      if ((possible_factor % existing_factor ) == 0)
        is_composite = true
        break
      end
    end
    factors << Integer(possible_factor) if not is_composite
  end
end

puts factors.inspect

# Sick solution using Ruby prime iterator
#
# require 'mathn'
# num, factor = 317584931803, 0
# primes = Prime.new
# while num > 1
#   factor = primes.next
#   num /= factor while (num % factor).zero?
# end
# puts factor