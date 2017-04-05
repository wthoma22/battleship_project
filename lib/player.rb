require 'pry'
require './lib/grid'
require './lib/ship/'
require './lib/computer/'
require './lib/messages'

class Player

  include Messages

  attr_reader :grid, :player_submarine, :player_destroyer, :computer_submarine, :computer_destroyer

  def initialize
    @grid = Grid.new
    @player_submarine
    @player_destroyer
    @computer_submarine
    @computer_destroyer
  end

  def show_user_start_messages
    computer_ships_placed_message
    grid_display
  end

  def validate_user_input(input)
    input.size == 2
  end

  def validate_user_input_2(input)
    input.size == 3
  end

  def user_place_first_ship
    show_user_start_messages

    user_input1 = gets.upcase.split(" ")
    if validate_user_input(user_input1)
      ship_cell_location = empty_cell_input(user_input1)
      @player_submarine = Ship.new(2, ship_cell_location)

    else
      invalid_message
      user_place_first_ship
    end
  end

  def user_place_second_ship
    p "Enter three coordinates for your second ship."
    user_input2=gets.upcase.split(" ")
    if validate_user_input_2(user_input2)
      ship_cell_location = empty_cell_input(user_input2)
      @player_destroyer = Ship.new(3, ship_cell_location)

    else
      invalid_message
      user_place_second_ship
    end
  end

  def empty_cell_input(user_input)
    user_input.map do |space|
      empty_string(space)
    end
  end

  def empty_string(space)
    new_space = []
    characters = space.scan /\w/

    case characters[1]
    when "1" then new_space.push(0)
    when "2" then new_space.push(1)
    when "3" then new_space.push(2)
    when "4" then new_space.push(3)
    end


    case characters[0]
    when "A" then new_space.push(0)
    when "B" then new_space.push(1)
    when "C" then new_space.push(2)
    when "D" then new_space.push(3)
    end

    return new_space
  end

  def user_guess(computer_submarine, computer_destroyer)
    p "Guess a coordinate to fire at the enemy!"
    user_guess = gets.upcase.chomp
    translated_guess = empty_string(user_guess)
    if computer_submarine.location.include? translated_guess
      hit_message
      computer_submarine.instance_variable_set(:@health, computer_submarine.health - 1)
      @grid.update_grid(translated_guess,"H")
    elsif computer_destroyer.location.include? translated_guess
      hit_message
      computer_destroyer.instance_variable_set(:@health, computer_destroyer.health - 1)
      @grid.update_grid(translated_guess,"H")

    else
      miss_message
      binding.pry
      @grid.update_grid(translated_guess,"M")
    end
  end
end
