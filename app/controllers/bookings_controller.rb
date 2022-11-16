class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "You've successfully booked this flight!"
      redirect_to booking_path(@booking)  
    else  
      render :new, status: :unprocessable_entity
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
