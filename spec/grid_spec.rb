require 'rspec'

describe 'Grid' do
  before :each do
    @grid = Grid.new(5, 5)
  end

  describe '#createnew' do
    it 'should create a new Grid object' do
      expect(@grid).to be_a Grid
    end

    it 'should not return nil' do
      expect(@grid).not_to be_nil
    end
  end

  describe 'valid?' do
    it 'should return true on valid rover coordinates based on grid config' do
      rover = Rover.new(0, 1, 1, 'N')
      expect(@grid.has_scope?(rover.dir.x, rover.dir.y, rover.dir.direction))
        .to be_truthy
    end

    it 'should return false if rover.x / rover.y is invalid for grid scope' do
      rover = Rover.new(0, 1, 6, 'N')
      expect(@grid.has_scope?(rover.dir.x, rover.dir.y, rover.dir.direction))
        .to be_falsey
    end

    it 'should return false if rover.direction is invalid' do
      rover = Rover.new(0, 1, 1, 'Q')
      expect(@grid.has_scope?(rover.dir.x, rover.dir.y, rover.dir.direction))
        .to be_falsey
    end
  end

  context 'when condition' do
    it 'succeeds' do
      puts("Passed")
    end
  end
end
