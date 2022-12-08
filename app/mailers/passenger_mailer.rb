class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def confirmation_email
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
    
    @passengers.each do |passenger|
      mail(to: passenger.email, subject: "Confirmation of Flight# #{@booking.flight_id}")
    end  
  end
end
