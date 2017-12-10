
class Cuboid
  attr_reader :pos, :width, :height, :length
  
  # Argument origin is lower left vertex [x, y, z]
  # Argument dimensions as [width, height, length]
  def initialize(origin = [0, 0, 0], dimensions = [1, 1, 1])
    @pos = origin
    @width, @height, @length = dimensions
    
    unless (width > 0 && height > 0 && length > 0)
      raise ArgumentError, 'Dimensions cannot be negative or zero'
    end
  end

  # Argument new_pos is a vertex [x, y, z]
  # This is returning true because the given test case said so.
  # I assume irl there would be cases for which it'd return false,
  # e.g. if the cuboid were out of bounds, or an intersecting cuboid existed.
  def move_to!(new_pos)
    @pos = new_pos
    true 
  end
  
  # Returns eight corner vertices, first four are the front face, last four the back face vertices
  def vertices
    x, y, z = @pos
    [
      [x, y, z],
      [x, y + height, z],
      [x + width, y, z],
      [x + width, y + height, z],
      [x, y, z + length],
      [x, y + height, z + length],
      [x + width, y, z + length],
      [x + width, y + height, z + length]
    ]
  end
  
  # Returns true if the two cuboids intersect each other. False otherwise.
  def intersects?(other)
    return true if pos == other.pos
    
    # other left of self
    !(other.pos[0] + other.width <= pos[0]) &&
    # other right of self
    !(other.pos[0] >= pos[0] + width) &&
    # other below self
    !(other.pos[1] + other.height <= pos[1]) &&
    # other above self
    !(other.pos[1] >= pos[1] + height) &&
    # other in front of self
    !(other.pos[2] + other.length <= pos[2]) &&
    # other behind self
    !(other.pos[2] >= pos[2] + length)
  end

end
