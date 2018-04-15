class FlightsController < ApplicationController

  def index
    @flight = Flight.new
    @flights = Flight.all
    @airports = Airport.all
  end

end
