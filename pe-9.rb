# PE#9
#
# A pythagorean triplet is one where a**2 + b**2 = c**2
# ex: 3**2 + 4**2 = 5**2
#
# There exists exactly one for which a + b + c = 1000. Find the product a*b*c.

require 'pe-library'

# Pythagorean triple generating function
# Suppose m, n are positive integers with m < n.
# Then (n**2 - m**2, 2mn, n**2 + m**2) is a pythagorean triple.

def generate_triple(m, n)
  return [n**2 - m**2, 2*m*n, n**2 + m**2]
end

triple = []
2.upto(100) do |n|
  1.upto(n - 1) do |m|
    triple = generate_triple(m, n)
    if (triple.sum == 1000)
      puts triple.inspect
      puts triple.inject(1) { |product, x| product * x}
    end
  end
end
