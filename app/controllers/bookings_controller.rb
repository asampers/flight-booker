class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(params[:booking][:flight_id])

    respond_to do |format|
      if @booking.save
        PassengerMailer.with(booking: @booking, flight: @flight).confirmation_email.deliver_later

        format.html { redirect_to(@booking, 
          notice: = "You've successfully booked this flight! Confirmation email sent.") }
      else  
        format.html { render :new, status: :unprocessable_entity }
      end   
    end   
  end 

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, 
      :passengers_attributes => [:name, :email])
  end
end
