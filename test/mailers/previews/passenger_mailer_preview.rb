# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_email
    @booking = Booking.first 

    Passenger.where('booking_id = ?', @booking.id).each do |p|
          PassengerMailer.with(booking: @booking, passenger: p).confirmation_email.deliver_now
        end 
  end
end
