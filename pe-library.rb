require 'mathn'
require 'set'
require 'rubygems'
require 'memoize'
include Memoize

class Array
  def sum
    return self.inject { |sum, i| sum + i }
  end
end

class Integer
  def even?
    return ((self % 2 == 0))
  end
  def odd?
    return ((self % 2 == 1))
  end
end

# Return all primes <= n
def euler_sieve(n)
  s = (0..n).to_a
  s[0] = s[1] = nil
  s.each do |p|
    next unless p
    break if p * p > n
    (p * p).step(n, p) { |m| s[m] = nil }
  end
  return s.compact
end

def product(a)
  return a.inject(1) { |product, element| product *= element }
end

def factorial(x)
  return x.downto(2).inject(1) { |product, x| product *= x }
end
memoize :factorial 

def assert(test, emit)
  if not test
    puts emit
  end
end

def factor(to_factor)
  highest_possible_factor = to_factor / 2.0
  prime_generator = Prime.new
  factors = []
  prime_generator.each do |prime|
    break if prime > highest_possible_factor
    factors << prime if to_factor % prime == 0
  end
  return factors
end

# def factors(to_factor)
#   highest_possible_factor = Math.sqrt(to_factor)
#   factors = []
#   if ((to_factor % 2) == 0)
#     factors << 2
#   end
#   (3..highest_possible_factor).step(2) do |possible_factor|
#     factors.each do |existing_factor|
#       if ((possible_factor % existing_factor ) == 0)
#         next
#       end
#     end
#     if ((to_factor % possible_factor) == 0)
#       factors << Integer(possible_factor)
#     end
#   end
#   return factors
# end

def isPrime?(number)
  if (number == 2) or (number == 3)
    return true
  end
  
  if (number <= 1) or (number % 2 == 0) or (number % 3 == 0)
    return nil
  end

  div = 5
  inc = 2
  maxdiv = Math::sqrt(number)+1

  prc = 0
  oldprc = 0

  while (div < maxdiv)
    if (number % div == 0)
      return nil
    end
    div = div + inc
    inc = 6 - inc
    # Debug code
    prc = (div/maxdiv*10000).to_i
    if prc > oldprc
      # printf("%.2f%% done.\n", prc.to_f/100)
      oldprc = prc
    end
  end

  return true
end