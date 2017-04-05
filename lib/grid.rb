require 'pry'
require './lib/player'
require './lib/computer'
require './lib/ship'

class Grid

  attr_reader :empty_spaces

  def initialize
    @empty_spaces = create_grid_spaces
  end

  def create_grid_spaces
    empty_spaces = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
  end

  def update_grid(location,result)
    binding.pry
    @empty_spaces[location[0].to_i][location[1].to_i] = result
    display
  end

  def display
    puts "==========="
    puts ". A B C D"
    puts "1 " + empty_spaces[0].join(" ").gsub("0", " ")
    puts "2 " + empty_spaces[1].join(" ").gsub("0", " ")
    puts "3 " + empty_spaces[2].join(" ").gsub("0", " ")
    puts "4 " + empty_spaces[3].join(" ").gsub("0", " ")
    puts "==========="
  end

end
