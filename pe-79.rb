# PE#79
# 
# A common security method used for online banking is to ask the user for three random characters from a passcode. 
# For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; 
# the expected reply would be: 317.
# 
# The text file, keylog.txt, contains fifty successful login attempts.
# 
# Given that the three characters are always asked for in order, analyse the file so as to determine 
# the shortest possible secret passcode of unknown length.

require 'set'
require 'gratr/import' # graph theory library

successful_attempts = File.open("pe-79.txt").readlines.map(&:strip).sort

# Might as well eliminate duplicates.
successful_attempts.uniq!

# The key is the "shortest possible" constraint. 
# The passcode can be unbounded in length; for example if it is a concatenation of all successful attempts.

# Split the successful attempts into digraphs of two numbers, since the minimal structure that we consider is 
# whether one digit comes after another. i.e. 129 => [1,2], [2,9], [1,9] in the sense that each a[0] occurs
# in the minimal key prior to each a[1]

def digraphs(triple)
  return [[triple[0], triple[1]], [triple[1], triple[2]], [triple[0], triple[2]]]
end

# meaning directed graph, confusing in the context of above 'digraph' meaning 'pair of characters'
dg = Digraph.new 

successful_attempts.each do |attempt|
  # Munge into arrays of digits, i.e. ["129", "160"] => [[1,2,9], [1,6,0]]
  integer_digits = attempt.chars.map(&:to_i)
  digraphs(integer_digits).each do |digraph| 
    dg = dg.add_edge(digraph[0], digraph[1])
  end
end

# topological sort, see http://en.wikipedia.org/wiki/Topological_sorting
p dg.topsort.join

# Find pairs of reversed digraphs, i.e. [1,0] and [0,1]
# reversed_digraphs = all_digraphs.find_all { |digraph| all_digraphs.include? digraph.reverse }
# Apparently there aren't any in our input set.

# 1[02689]
# 2[089]
# 3[012689]
# 6[0289]
# 7[123689]
# 8[09]
# 9[0]