require 'rails_helper'

RSpec.describe Rover, type: :model do
  describe 'validations' do
    it 'requires position_x, position_y, direction' do
      rover = FactoryGirl.create(:rover)
      expect(rover.valid?).not_to be_falsey
    end

    it 'requires name to be unique for one rover' do
      rover_one = FactoryGirl.create(:rover)
      rover_two = FactoryGirl.create(:rover)

      expect(rover_one.valid?).not_to be_falsey
      expect(rover_two.valid?).not_to be_falsey
    end

    it 'requires direction should be valid' do
      rover = Rover.create(position_x: 1, position_y: 2, direction: "K")
      expect(rover.valid?).to be_falsey
    end

    it 'requires direction should be invalid' do
      rover = Rover.create(position_x: 1, position_y: 2, direction: "K")
      expect(rover.valid?).to be_falsey
    end

    it 'requires direction should be valid' do
      rover = Rover.create(position_x: 1, position_y: 2, direction: "N")
      expect(rover.valid?).to be_truthy
    end
  end

  it 'decode the commands and return the new positions of rovers' do
    rover = Rover.create(position_x: 3, position_y: 3, direction: "E")
    expect(rover.get_positions("MMRMMRMRRM")).to eq({:position_x=>5, :position_y=>1, :direction=>"E"})
  end

  it 'decode the commands and return the new positions of rover' do
    rover = Rover.create(position_x: 3, position_y: 3, direction: "E")
    expect(rover.get_positions("MMRMMRMRRM")).to eq({:position_x=>5, :position_y=>1, :direction=>"E"})
  end

end
