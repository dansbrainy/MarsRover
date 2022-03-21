class Grid
  attr_reader :top_right_x, :top_right_y, :occupied
  attr_writer :occupied

  # Constructor
  def initialize(top_right_x = 0, top_right_y = 0)
    @top_right_x = top_right_x
    @top_right_y = top_right_y
    @occupied = []
  end


  # Function to check if the rover co-ordinates input are within the scope
  def has_scope?(position_x, position_y, direction)
    if position_x.between?(0, @top_right_x) &&
      position_y.between?(0, @top_right_y) &&
      %w[N S E W].include?(direction)
      true
    else
      # explicit error raised
      if not position_x.between?(0, @top_right_x)
        puts "---------------------------------------------"
        puts("x Value Error: #{position_x} --> x must be between the grid x co-ordinates: 0 and #{@top_right_x}")
      elsif not position_y.between?(0, @top_right_y)
        puts "---------------------------------------------"
        puts("y Value Error: #{position_y} --> y must be between the grid y co-ordinates: 0 and #{@top_right_y}")
      elsif not %w[N S E W].include?(direction)
        puts "---------------------------------------------"
        puts("direction Value Error: #{direction} --> direction must be between: [N, S, E, W]")
      end
      false
    end
  end

end
