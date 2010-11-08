# PE#15
#
# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
# We move between intersections of the grid lines, not the grid boxes.
# 
# (right, right, down, down); (right, down, right, down); (right, down, down, right)
# (down, right, right, down); (down, right, down, right); (down, down, right, right)
#
# How many routes are there through a 20x20 grid?

# From the top left, take each of the available paths. 
# If there is only one available path, you're done, increment the global count.

def recurse(x, y)  
  
  if (x == @grid_size) or (y == @grid_size) 
    return 1
  end
  
  # By symmetry, on the x==y axis we just double the down branch
  if (x == y)
    return recurse(x, y+1) * 2  
  end
  
  # Branch right
  right = recurse(x+1, y)
  
  # Branch down
  down = recurse(x, y+1)
  
  # return right+down
  return right+down
end

# Works, but slow... 
#
# Since the grid is symmetric around x==y you can prune by a factor of 2 

def time
  start = Time.now
  yield
  stop = Time.now
  puts stop - start
end

def solve_grid(size)
  @grid_size = size
  recurse(0,0)
end

def go
  (1..20).each do |i|
    time { puts "#{i}: #{solve_grid(i)}" }
  end
end

go