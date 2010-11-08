# PE#10
# Find the sum of all primes below two million

require 'mathn'

prime_generator = Prime.new
prime = 0

sum = 0
while ((prime = prime_generator.next) < 2000000)
  sum = sum + prime
end

puts sum

# wolframalpha.com
# sum primes between 1 and 2000000
# 142913828922