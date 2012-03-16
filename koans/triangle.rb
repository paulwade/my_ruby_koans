# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  @sides = [a, b, c].sort
  if @sides.any? { |x| x <= 0}
    raise TriangleError.new("All sides must be greater than zero.")
  end

  if @sides[0] + @sides[1] <= @sides[2]
    raise TriangleError.new("Invalid side lengths.")
  end

  if a == b && b == c
    :equilateral
  elsif a == b || a == c || b == c
    :isosceles
  else
    :scalene
  end

end

# ENLIGHTENMENT:
#
# A much more elegant solution ()using features I haven't learned yet)
# from http://stackoverflow.com/questions/4742692/a-more-elegant-solution-to-ruby-koans-triangle-rb
def elegant_triangle(a, b, c)
  case [a,b,c].uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    else        :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
