class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def confirmation_email
    @booking = params[:booking]
    @flight = params[:flight]
    @passengers = @booking.passengers
    @url = root_url

    @passengers.each do |passenger|
      mail(to: passenger.email, subject: "Confirmation of Flight# #{@flight.id}")
    end  
  end
end
