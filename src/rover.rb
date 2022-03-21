require_relative 'location'

class Rover
  attr_accessor :id, :dir

  def initialize(index, x, y, direction)
    @id = index
    @dir = Location.new(x: x, y: y, direction: direction)
  end

  def output
    puts [@dir.x, @dir.y, @dir.direction].join(' ')
  end

  def move
    @dir.move_forward
  end

  def spin_right
    @dir.turn_right
  end

  def spin_left
    @dir.turn_left
  end
end