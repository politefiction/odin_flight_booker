class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.passengers.build
    if params[:flight_id]
      @flight = Flight.find(params[:flight_id])
    else
      flash[:danger] = "Please choose a flight."
      redirect_to root_url
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      num_seats = @booking.flight.num_seats
      num_passengers = @booking.flight.passengers.count
      @booking.flight.update_attribute("num_seats", (num_seats - num_passengers))
      PassengerMailer.with(booking: @booking).thanks_email.deliver_now
      flash[:success] = "Flight booked."
      redirect_to booking_path(@booking.id)
    else
      flash[:danger] = "Booking unsuccessful. Please try again."
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
  end
end
