require 'pry'

module Messages

  def game_introduction
    puts "Welcome to BATTLESHIP"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    response
  end

  def end_message
    puts "Come back with your fleet ready!"
  end

  def instructions
    puts "The object of Battleship is to try and sink all of the computers
    ships before it sinks all of yours. You try and hit them by typing the
    coordinates of one of the squares on the board.  The computer will also
    try to hit your ships by 'calling' out coordinates. Since you cannot
    see the computer's board you must try to guess where the ships are."
    puts ""
    puts "Each player places the 2 ships somewhere on their board.  The
    ships can only be placed vertically or horizontally. Diagonal placement
    is not allowed. No part of a ship may hang off the edge of the board.
    Ships may not overlap each other.  No ships may be placed on another ship.
    You and the computer will take turns guessing coordinates. Either a hit
    or miss message will be displayed as appropriate and recorded on your
    board."
    puts ""
    puts "When all of the squares that one your ships occupies have been hit,
    the ship will be sunk. As soon as all of one player's ships have been sunk,
    the game ends."
    puts ""
    puts "Would you like to (p)lay, or (q)uit?"
    response
  end

  def response
    answer = gets.chomp
    if answer == "p"
      play_battleship
    elsif answer == "i"
      instructions
    else
      end_message
    end
  end

# might need to keep puts instead of p here
  def computer_ships_placed_message
    p "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship:"
  end

  def grid_display
    p "Enter the coordinates for your two unit ship ex A1 A2.
    ===========
    . 1 2 3 4
    A
    B
    C
    D
    ==========="
  end
end
