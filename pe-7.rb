# PE#7
# Find the 10001st prime number

require 'mathn'
prime_generator = Prime.new
10000.times { prime_generator.next }
puts prime_generator.next
  
