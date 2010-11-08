# PE#25
#

require "rubygems"
require "memoize"
include Memoize

def fib(i)
  return 0 if i == 0
  return 1 if i == 1
  return fib(i-1) + fib(i-2)
end

memoize :fib

i = 0

digits = 0
while (digits < 1000)
  number = fib(i)
  digits = number.to_s.length
  
  puts "i: #{i} fib: #{number} digits: #{digits}"
  
  i += 1
end




