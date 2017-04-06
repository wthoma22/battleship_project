require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require './lib/grid'
require './lib/ship/'
require './lib/player/'
require './lib/messages'

class ComputerTest < Minitest::Test

   def test_it_exists
     computer = Computer.new
     assert_equal Computer, computer.class
   end

   def test_computer_input_first
     skip
     computer = Computer.new
     computer.computer_input_first
     assert_includes [0, 3], [0,2], computer.computer_input_first.location
   end

   def test_computer_input_second
     skip
     player = Computer.new
     destroyer = Ship.new
     assert_includes [[0, 3], [0,2], [0,1]], player.user_place_first_ship
   end

   def test_computer_can_guess
     skip
     computer = Computer.new
     assert_equal [0, 0], computer.computer_guess("A1", "A2")
     assert_equal [0, 1], computer.computer_guess("B1", "B2")
     assert_equal [2, 0], computer.computer_guess("A3", "B3")
     assert_equal [1, 3], computer.computer_guess("D2", "D3")
   end

end
