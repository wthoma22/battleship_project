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

  def user_place_first_ship
    # get user input
    # do some shit to it


    user_input1 = gets.upcase.split(" ")
    if user_input1.size > 2 || user_input1.size < 2
      puts "Invalid entry, guess again!"
      user_place_first_ship

    else
      ship_cell_location = translate_input(user_input1)
      @player_submarine = Ship.new(2, ship_cell_location)
    end
  end

  def user_place_second_ship
    puts "Enter three coordinates for your second ship."
    user_input2=gets.upcase.split(" ")
    if user_input2.size > 3 || user_input2.size < 3
      puts "Invalid, Guess again!"
      user_place_second_ship

    else
      ship_cell_location = translate_input(user_input2)
      @player_destroyer = Ship.new(3, ship_cell_location)
    end
  end

  def translate_input(user_input)
    user_input.map do |space|
      translate_string(space)
    end
  end

  def translate_string(space)
    new_space = []
    characters = space.scan /\w/

    case characters[1]
    when "1"
      new_space.push(0)
    when "2"
      new_space.push(1)
    when "3"
      new_space.push(2)
    else
      new_space.push(3)
    end

    case characters[0]
    when "A"
      new_space.push(0)
    when "B"
      new_space.push(1)
    when "C"
      new_space.push(2)
    else
      new_space.push(3)
    end
    return new_space
  end

  def user_guess(computer_submarine, computer_destroyer)
    puts "Guess a coordinate to fire at the enemy!"
    user_guess = gets.upcase
    translated_guess = translate_string(user_guess)
    if computer_submarine.location.include? translated_guess
      puts "It's a hit!"
      computer_submarine.instance_variable_set(:@health, computer_submarine.health - 1)
      @grid.update_grid(translated_guess,"H")
    elsif computer_destroyer.location.include? translated_guess
      puts "It's a hit!"
      computer_destroyer.instance_variable_set(:@health, computer_destroyer.health - 1)
      @grid.update_grid(translated_guess,"H")
    else
      puts "It's a miss.."
      @grid.update_grid(translated_guess,"M")
    end
  end
end
