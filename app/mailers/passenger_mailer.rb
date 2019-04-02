class PassengerMailer < ApplicationMailer
    default from: 'no-reply@example.com'
    default to: 'test@example.com'
    layout 'mailer'

    def thanks_email
        @booking = Booking.find(params[:booking][:id])
        #@passengers = @booking.passengers
        mail(to: @booking.passengers.first.email, subject: "Thank you for booking!")
    end
end
