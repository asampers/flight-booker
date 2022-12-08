class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def confirmation_email
    @booking = Booking.find(params[:id])
    @flight = Flight.find(params[:booking][:flight_id])
    @passengers = @booking.passengers
    @url = root_url

    @passengers.each do |passenger|
      mail(to: passenger.email, subject: "Confirmation of Flight# #{@flight.id}")
    end  
  end
end
