require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class MessageTest < Minitest::Test

   def test_intro
     actual = puts "Welcome to BATTLESHIP"
     puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
     assert_equal actual, Messages.game_introduction
   end

   def test_ending
     actual = "Come back with your fleet ready!"
     assert_equal actual, Messages.end_message
   end

end
