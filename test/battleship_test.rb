require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require './lib/player'
require './lib/computer'
require './lib/messages'

class BattleShipTest < Minitest::Test

  def test_it_exists
    b = BattleShip.new
    assert_equal BattleShip, b.class
  end

end
