require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class MessageTest < Minitest::Test

  include Messages

   def test_ending
     assert_equal "Come back with your fleet ready!", Messages.end_message
   end

   def test_computer_ships_place_message
     assert_equal "Come back with your fleet ready!", Messages.end_message
   end

   def test_invalid_message
     assert_equal "Invalid guess, please try again", Messages.invalid_message
   end

   def test_hit_message
     assert_equal "It's a hit!", Messages.hit_message
   end

   def test_miss_message
     assert_equal "It's a miss..", Messages.miss_message
   end

   def test_submarine_hit_message
     assert_equal "The computer has hit your submarine!", Messages.submarine_hit_message
   end

   def test_destroyer_hit_message
     assert_equal "The computer has hit your destroyer!", Messages.destroyer_hit_message
   end

   def test_computer_missed_message
     assert_equal "The computer has missed you!", Messages.computer_missed_message
   end

   def test_coordinates_message
     assert_equal "Enter three coordinates for your second ship.", Messages.coordinates_message
   end

   def test_fire_message
     assert_equal "Guess a coordinate to fire at the enemy!", Messages.fire_at_enemy_message
   end

end
