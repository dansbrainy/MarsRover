require 'rspec'
require_relative 'spec_helper'

describe 'Operator' do
  before :all do
    @operator = Operator.new
  end

  after do
    
  end

  describe '#new' do
    it 'should return a new operator object' do
      expect(@operator).to be_a Operator
    end

    it 'should not return nil' do
      expect(@operator).not_to be_nil
    end
  end

  describe '#input_grid_valid' do
    it 'should return true for valid input of grid coordinates' do
      expect(@operator.is_valid_grid_input?(5, 5)).to be_truthy
    end

    it 'should return false for invalid  input of grid coordinates' do
      expect(@operator.is_valid_grid_input?('a', 5)).to be_falsey
    end
  end

  describe '#take_grid_coordinates' do
    it 'should take input grid and create a Grid object' do
      allow(@operator).to receive(:gets).and_return('5 5')
      @operator.input_grid_coordinates
      expect(@operator.grid.top_right_x).to eq(5)
      expect(@operator.grid.top_right_y).to eq(5)
    end

    it 'should raise ArgumentError on invalid grip input' do
      allow(@operator).to receive(:gets).and_return('a 5')
      expect { @operator.input_grid_coordinates }.to raise_error(ArgumentError)
    end
  end

  describe '#execute_instruction' do
    it 'should execute valid instruction' do
      allow(STDOUT).to receive(:puts)
      @operator.rover = Rover.new(0, 2, 2, 'N')
      expect(@operator.execute_instruction('M')).not_to be_falsey
    end

    it 'should return false on invalid instruction' do
      allow(STDOUT).to receive(:puts)
      @operator.rover = Rover.new(0, 3, 3, 'N')
      expect(@operator.execute_instruction('U')).to be_falsey
    end
  end

  context 'when condition' do
    it 'succeeds' do
      puts("Passed")
    end
  end
end