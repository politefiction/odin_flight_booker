class FlightsController < ApplicationController

  def index
    @flight = Flight.new
    @flights = Flight.all
    @airports = Airport.all
    if params[:from_airport] and params[:to_airport] and params[:departure]
      @flight_choices = Flight.search(params[:from_airport], params[:to_airport], params[:departure])
    end
  end

  private
  def flight_params
    params.require(:flight).permit(:from_airport, :to_airport, :departure)
  end
end
