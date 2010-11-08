# PE#48
# The series (1..10).inject { |sum, x| sum += x**x } == 10405071317
# Find the last ten digits of the series with i up to 1000.

require 'benchmark'

puts Benchmark.measure {
  result = (1..1000).inject { |sum, x| sum += x**x }
  puts result.to_s[-10..-1]
}