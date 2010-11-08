# PE#22

require 'pe-library'

def l
  load 'pe-22.rb'
end

names = File.open("pe-22.txt").lines.inject([]) { 
  |all, line| all += line.gsub(/\"/, "").split(",")
}
names.sort!

def alpha_score(name)
  name.downcase!
  # This confusing bit of syntactic glop relies on the following:
  # 'a'[0] == ?a == ascii value of a
  letter_values = name.chars.collect { |char| char[0] - ?a + 1 }.sum
end

sum = 0
names.each_with_index do |name, index|
  # Ah. #938 in the list is #937 in the array :)
  sum += ((index + 1) * alpha_score(name))
end
p sum