require 'pry'
require './lib/player'
require './lib/computer'
require './lib/messages'

class BattleShip

  include Messages

  def initialize
    @menu = menu
  end

  def menu
    game_introduction
    response
    play_battleship
  end

  def play_battleship
    computer = Computer.new
    computer.computer_input_first
    computer.computer_input_second
    player = Player.new
    player.user_place_first_ship
    player.user_place_second_ship
    play_game(player, computer)
  end

  def play_game(player, computer)
    continue = true
    while(continue)
      player.user_guess(computer.computer_submarine, computer.computer_destroyer)
      if computer.computer_submarine.health == 0 && computer.computer_destroyer.health == 0
        continue = false
        abort("YOU WON!")
      else
        computer.computer_guess(player.player_submarine, player.player_destroyer)
        if player.player_submarine.health == 0 && player.player_destroyer.health == 0
          continue = false
          abort("YOU LOST!")
        end
      end
    end
  end

end

# b = BattleShip.new
