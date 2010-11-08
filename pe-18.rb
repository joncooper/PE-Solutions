# PE#18

DEBUG = false

@triangle_data = <<EOT
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOT

# Build a tree

class Node
  def initialize(value, branch_direction = nil, subtree_value = nil)
    @value = value
    @branch_direction = branch_direction
    @subtree_value = subtree_value
    @left_child = nil
    @right_child = nil
  end
  def inspect
    "value: #{@value} branch_direction: #{branch_direction} subtree_value: #{subtree_value}"
  end
  attr_accessor :parent, :left_child, :right_child, :value, :branch_direction, :subtree_value
end

# Slightly ganky

@triangle = @triangle_data.split("\n").map! { |element| element.split(" ").map! { |number| Node.new(number.to_i) } }
@triangle_height = @triangle.length - 1

# Set up parent-child relationships

@triangle.each_with_index do |row, row_index|
  row.each_with_index do |element, element_index|
    next if row_index == @triangle_height 
    element.left_child = @triangle[row_index+1][element_index]
    element.right_child = @triangle[row_index+1][element_index+1]
    element.left_child.parent = element
    element.right_child.parent = element
  end
end

if DEBUG
  @triangle.each do |row| 
    puts row.inspect
  end
end

# Start on 2nd to last row (the last decision row)
# At each element, tag with the value of that node + the best choice below + which branch that is

@triangle_height.downto(0) do |row_index|
  @triangle[row_index].each_with_index do |element, element_index|
    if row_index == @triangle_height
      element.subtree_value = element.value
      next
    end
    left_branch_value = element.value + element.left_child.subtree_value
    right_branch_value = element.value + element.right_child.subtree_value
    if left_branch_value > right_branch_value
      element.subtree_value = left_branch_value
      element.branch_direction = "left"
    else
      element.subtree_value = right_branch_value
      element.branch_direction ="right"
    end
  end
end

puts @triangle[0][0].subtree_value


