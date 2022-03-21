require 'rspec'
require_relative 'spec_helper'

describe Rover do
  before :each do
    @rover = Rover.new(0, 1, 1, 'N')
  end

  after do
    
  end

  describe '#createnew' do
    it 'should return a new rover object' do
      expect(@rover).to be_a Rover
    end

    it 'should not return nil' do
      expect(@rover).not_to be_nil
    end
  end

  describe '#move' do
    it 'should call move_forward on Location attr' do
      expect(@rover.dir).to receive(:move_forward)
      @rover.move
    end
  end

  describe '#spin_right' do
    it 'should call turn_right on Location attr' do
      expect(@rover.dir).to receive(:turn_right)
      @rover.spin_right
    end
  end

  describe '#spin_left' do
    it 'should call turn_left on Location attr' do
      expect(@rover.dir).to receive(:turn_left)
      @rover.spin_left
    end
  end

  context 'when condition' do
    it 'succeeds' do
      puts("Passed")
    end
  end
end
