class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def confirmation_email
    @booking = params[:booking]
    @flight = Flight.find(params[:booking][:flight_id])
    @url = root_url

    @booking.passengers.each do |passenger|
      @passenger = passenger
      mail(to: email_address_with_name(@passenger.email, @passenger.name), subject: "Confirmation of Flight# #{@flight.id} ") 
    end
  end
end
