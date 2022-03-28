require_relative 'rover'
require_relative 'grid'

class Operator
  attr_accessor :grid, :rover

  # functions checks if the grid top-right co-ordinates inputs are valid numbers
  def is_valid_grid_input?(grid_top_right_x, grid_top_right_y)
    Integer(grid_top_right_x) && Integer(grid_top_right_y) rescue false
  end

  # Gets co-ordinates and create grid
  def input_grid_coordinates
    grid_top_right_x, grid_top_right_y = gets.chomp.split(' ')
    raise ArgumentError, 'Invalid grid coordinates' unless \
    is_valid_grid_input?(grid_top_right_x, grid_top_right_y)
    @grid = Grid.new(grid_top_right_x.to_i, grid_top_right_y.to_i)
  end


  def create_rover(index, coord_x, coord_y, direction)

    begin
      @rover = Rover.new(index, coord_x.to_i, coord_y.to_i, direction.to_s)
      @grid.occupied.append('index'=> index, 'x'=> coord_x.to_i, 'y'=> coord_y.to_i, 'd' => direction)
    end

  end

  def update_input_coordinates(index, coord_x, coord_y, direction)
    @grid.occupied.select { |h| h['index'] == index}.map{ |r| r.update( { 'index' => index, 'x' => coord_x, 'y' => coord_y, 'd' => direction} ) }
  end

  def output_rovers
    puts(@grid.occupied)
  end

  def start_rovers
    """This is the entry point for starting the rover"""

    ARGF.each_slice(2).each_with_index do |lines, index|
      position_x, position_y, direction = lines[0].split

      unless @grid.has_scope?(position_x.to_i, position_y.to_i, direction.to_s) and @grid.space_is_not_occupied?(position_x.to_i, position_y.to_i)
        puts "Rover co-ordinates out of valid scope: rover #{index} --> (#{position_x}, #{position_y}, #{direction})"
        next
      end

      # Create a new rover object or throw an error if spce occupied
      create_rover(index, position_x, position_y, direction)

      catch :invalid_instruction do
        lines[1].chomp.each_char do |instruction|
          throw :invalid_instruction unless execute_instruction(instruction)
        end
      end

      next unless @rover.id != -1
      if update_input_coordinates(index, @rover.get_x, @rover.get_y, @rover.get_direction) 
        @rover.output 
      end
      output_rovers
    end
  end

  def execute_instruction(instruction)
    case instruction
    when 'L'
      @rover.spin_left
    when 'M'
      @rover.move
    when 'R'
      @rover.spin_right
    else
      puts "Error: Invalid instruction '#{instruction}'. " \
         'Allowed instructions: L, M, R'
      @rover.id = -1
      return false
    end

  end
end

if __FILE__ == $PROGRAM_NAME
  operator = Operator.new
  operator.input_grid_coordinates
  operator.start_rovers
end

