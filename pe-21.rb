# PE#21

# Let d(n) be defined as the sum of proper divisors of n 
# If d(a) = b and d(b) = a where a != b then a and b are an amicable pair and each of a and b are called amicable numbers
# 
# For example the proper divisors of 220 are 1,2,4,5,10,11,20,22,44,55,110 therefore d(220) = 284
# The proper divisors of 284 are 1,2,4,71,142 so d(284) == 220
# 
# Evaluate the sum of all amicable numbers under 10000.

# require 'rational'
# num = (1..20).inject(1) { |result, n| result.lcm n }

require 'pe-library'
require 'mathn'
require 'rational'
require 'set'

def divisors(i)
  divisor_set = Set.new
  divisor_set << 1
  prime_factors = i.prime_division
  for pair in prime_factors
    base, exponent = pair
    divisor_set.merge(exponent.downto(1).collect { |y| base ** y })
  end
  divisor_set.each do |x|
    divisor_set.each do |y|
      divisor_set << x.lcm(y)
    end
  end
  divisor_set.delete(i)
  return divisor_set
end

# Create a map from x => d(x)
amicable_map = {}
amicable_numbers = Set.new

for i in 1..10000
  sum_of_divisors = divisors(i).flatten.inject { |sum, x| sum += x }
  amicable_map[i] = sum_of_divisors
  if (amicable_map[sum_of_divisors] == i) and (i != sum_of_divisors) # RTFM DOOD
    amicable_numbers << i
    amicable_numbers << sum_of_divisors
    puts "#{i}, #{sum_of_divisors}"
  end
end

p amicable_numbers.sort
puts Array(amicable_numbers)x.sum
