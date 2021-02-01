require_relative 'plane' 
require_relative 'weather'

class Airport
    attr_reader :plane, :airport_capacity, :weather
  def initialize(capacity = 5, weather = Weather.new)
    @airport_capacity = capacity
    @weather = weather
    @plane = []
  end

  def land(plane)
    raise 'The airport is full' if full? 
    raise 'Too stormy to land' if weather == 'stormy'
    @plane.push(plane)
  end

  def take_off(plane)
    raise 'Cannot take off due to storm' if weather == 'stormy'
     @plane.delete(plane)
    
  end

  def weather
    @weather.stormy?
  end

  private

  def full?
    @plane.length  >= @airport_capacity
  end
end