class Location
  LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }

  RIGHT = {
    'N' => 'E',
    'E' => 'S',
    'S' => 'W',
    'W' => 'N'
  }

  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def turn_left
    @direction = LEFT.fetch(@direction)
    self
  end

  def turn_right
    @direction = RIGHT.fetch(@direction)
    self
  end

  def move_forward
    case direction
    when 'N'
      self.y += 1
    when 'E'
      self.x += 1
    when 'S'
      self.y -= 1
    when 'W'
      self.x -= 1
    end
    self
  end

  attr_reader :x, :y, :direction

  private
  attr_writer :x, :y, :direction
end
