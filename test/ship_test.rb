require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

   def test_it_exists
     ship = Ship.new(2, 0)
     assert_equal Ship, ship.class
   end

   def test_ship_has_length
     submarine = Ship.new(2, 0)
     assert_equal 2, submarine.size
   end

   def test_multiple_ships_can_be_made
     submarine = Ship.new(2, 0)
     destroyer = Ship.new(3, 0)
     assert_equal 2, submarine.size
     assert_equal 3, destroyer.size
   end

   def test_ship_has_health_equal_to_size
     destroyer = Ship.new(3, 0)
     assert_equal 3, destroyer.health
   end

   def test_ship_can_be_assigned_position
     submarine = Ship.new(2, 1)
     assert_equal 1, submarine.location
   end

end
