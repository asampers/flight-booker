class FlightsController < ApplicationController
  def index
    if params[:search]
      @booking_options = flight_results 
      @tickets = params[:num_tickets]
    end  
    @airport_cities = Airport.all.map { |a| [a.location, a.id ] }
    @dates = Flight.all.map { |f| [f.departure_date.strftime("%m/%d/%Y")] }.uniq
  end

  def flight_results
    flights = Flight.where('origin_id = ? AND destination_id = ? AND departure_date = ?', 
          params[:origin_id], params[:destination_id], params[:departure_date])
  end

  private

  def search_params
    params.permit(:origin_id, :destination_id, :departure_date)
  end    
end
