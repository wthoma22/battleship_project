require 'pry'
require './lib/grid'
require './lib/ship/'
require './lib/player/'
require './lib/messages'

class Computer

  include Messages

  attr_reader :grid, :computer_submarine, :computer_destroyer

  def initialize
    @grid = Grid.new
    @computer_submarine
    @computer_destroyer
  end

  def computer_input_first
    numbers = [0,1,2,3]
    sample1 = numbers.sample(2)
    h_or_v=[1,2]
    orientation = h_or_v.sample(1)
    if orientation == 1
      if sample1[0] + 1 <= 3
        sample2=[sample1[0] + 1, sample[1]]
      else
        sample2=[sample1[0] - 1, sample[1]]
      end
    else
      if sample1[1] + 1 <= 3
        sample2=[sample1[0], sample1[1] + 1]
      else
        sample2=[sample1[0], sample1[1] - 1]
      end
    end
    @computer_submarine = Ship.new(2,[sample1, sample2])
  end

  def computer_input_second
    numbers = [0,1,2,3]
    sample1 = numbers.sample(2)
    h_or_v=[1,2]
    orientation = h_or_v.sample(1)
    if orientation == 1
      if sample1[0] + 2 <= 3
        sample2=[sample1[0] + 1, sample[1]]
        sample3=[sample1[0] + 2, sample[1]]
      else
        sample2=[sample1[0] - 1, sample[1]]
        sample3=[sample1[0] - 2, sample[1]]
      end
    else
      if sample1[1] + 2 <= 3
        sample2=[sample1[0], sample1[1] + 1]
        sample3=[sample1[0], sample1[1] + 2]
      else
        sample2=[sample1[0], sample1[1] - 1]
        sample3=[sample1[0], sample1[1] - 2]
      end
    end
    @computer_destroyer = Ship.new(3,[sample1, sample2, sample3])
  end

  def computer_guess(player_submarine, player_destroyer)
    numbers = [0,1,2,3]
    guess = numbers.sample(2)
    if player_submarine.location.include? guess
      p "The computer has hit your submarine!"
      player_submarine.instance_variable_set(:@health, player_submarine.health - 1)
    elsif player_destroyer.location.include? guess
      p "The computer has hit your destroyer!"
      player_destroyer.instance_variable_set(:@health, player_destroyer.health - 1)
    else
      p "The computer has missed you!"
    end
  end
end
