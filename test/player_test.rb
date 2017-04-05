require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/grid'
require './lib/ship/'
require './lib/computer/'
require './lib/messages'

class PlayerTest < Minitest::Test

   def test_it_exists
     skip
     player = Player.new
     assert_equal Player, player.class
   end
   def test_user_can_place_ship
     skip
     player = Player.new
     submarine = Ship.new(2, 0)
     player.user_place_first_ship
   end

   def test_user_place_first_ship
     skip
     player = Player.new
     assert_equal "something", player.user_place_first_ship
   end

   def test_show_user_start_messages
     player = Player.new
     assert_includes player.show_user_start_messages, "Enter the coordinates for your two unit ship ex A1 A2."
   end

end
