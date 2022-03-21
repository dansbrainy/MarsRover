require 'rspec'

describe 'Location' do
  before :each do
    @dir = Location.new(x: 1, y: 1, direction: 'N')
  end

  describe '#new' do
    it 'should return a new Location object' do
      expect(@dir).to be_a Location
    end

    it 'should not return nil' do
      expect(@dir).not_to be_nil
    end
  end

  describe '#turn_left' do
    it 'should return a new direction' do
      directions_remaining = %w(N S E W) - [@dir.direction]
      @dir.turn_left
      expect(directions_remaining).to include @dir.direction
    end

    it 'should rotate current direction to left' do
      @dir.turn_left
      expect(@dir.direction).to eq('W')
    end
  end

  describe '#turn_right' do
    it 'should return a new direction' do
      directions_remaining = %w(N S E W) - [@dir.direction]
      @dir.turn_right
      expect(directions_remaining).to include @dir.direction
    end

    it 'should rotate current direction to right' do
      @dir.turn_right
      expect(@dir.direction).to eq('E')
    end
  end

  describe '#move_forward' do
    it 'should move a single step in current direction' do
      coord_y = @dir.y
      @dir.move_forward
      expect(@dir.y - coord_y).to eq(1)
    end

    it 'should move only along single axis' do
      coord_x = @dir.x
      @dir.move_forward
      expect(@dir.x - coord_x).to eq(0)
    end
  end

  context 'when condition' do
    it 'succeeds' do
      puts("Passed")
    end
  end
end
