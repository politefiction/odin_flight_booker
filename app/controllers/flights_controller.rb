class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airports = Airport.all
    if params[:from_airport] and params[:to_airport] and params[:departure]
      @flight_choices = Flight.search(params[:from_airport], params[:to_airport], params[:departure]).where("num_seats >= ?", params[:num_passengers])
    end
  end
  
end
