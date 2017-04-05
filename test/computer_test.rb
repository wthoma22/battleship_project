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

   def test_computer_can_place_ship
     computer = Computer.new
     computer.computer_input_first
     assert_equal [[0, 3], [0,2]], computer.computer_input_first.location
   end

end
