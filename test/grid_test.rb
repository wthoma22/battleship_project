require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid'
require './lib/player'
require './lib/computer'
require './lib/ship'

class GridTest < Minitest::Test

   def test_it_exists
     grid = Grid.new
     assert_equal Grid, grid.class
   end

   def test_starts_with_empty_space
     grid = Grid.new
     assert_equal [0,0,0,0], grid.create_grid_spaces[0]
   end

   def test_display_is_string
     grid = Grid.new
     assert_nil grid.display
   end

end
