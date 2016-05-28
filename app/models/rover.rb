class Rover < ActiveRecord::Base

  validates_presence_of :position_x, :position_y, :direction
  validates_numericality_of :position_x, :position_y
  validates :name, uniqueness: true
  validates :direction, :inclusion => {:in => %w(N S E W), :message => "%{value} is not valid, only `N, S, E, W` are acceptable "}

  before_create :name_the_rover, on: :create
  VALID_COMMANDS = ['R', 'L', 'M']

  def get_positions(commands)
    # Check if command is valid
    if !commands.blank? && validate_commands(commands)
      commands.each_char do |command|
        evaluate_instructions(command)
      end

      # Prepare updated params
      rover = {:position_x => self.position_x, :position_y => self.position_y, :direction => self.direction}
      # Return the updated params
      return rover
    end
    false
  end

  private

# Validate input commands
  def validate_commands(commands)
    commands.each_char do |command|
      return false unless VALID_COMMANDS.include?(command)
    end
    true
  end

# Decode the commands and take actions
  def evaluate_instructions(instruction)
    case instruction
      when 'L' then
        turn('L')
      when 'R' then
        turn('R')
      when 'M' then
        move
    end
  end

# Move the Rover to direction
  def move
    case self.direction
      when 'N' then
        self.position_y += 1
      when 'S' then
        self.position_y -= 1
      when 'E' then
        self.position_x += 1
      when 'W' then
        self.position_x -= 1
    end
  end

# Turn the Rover 90 degree left or right respectively
  def turn(turning_direction)
    case self.direction
      when 'N' then
        self.direction = turning_direction == 'L' ? 'W' : 'E'
      when 'E' then
        self.direction = turning_direction == 'L' ? 'N' : 'S'
      when 'S' then
        self.direction = turning_direction == 'L' ? 'E' : 'W'
      when 'W' then
        self.direction = turning_direction == 'L' ? 'S' : 'N'
    end
  end

# Generate some random name and assign to rover
  def name_the_rover
    self.name = SecureRandom.hex(10)
  end

end
