require 'pry'

class Ship

  attr_reader :size, :location , :health

  def initialize(size, location)
    @size = size
    @location = location
    @health = size
  end
end
