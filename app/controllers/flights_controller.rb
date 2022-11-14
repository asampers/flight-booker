class FlightsController < ApplicationController
  # GET /flights 
  def index
    if params[:search]
      @flights = flight_results 
    end  
    @airport_cities = Airport.all.map { |a| [a.location, a.id ] }
    @dates = Flight.all.map { |f| [f.departure_date.strftime("%m/%d/%Y")] }.uniq
  end

  def flight_results
    flights = Flight.where('origin_id = ? AND destination_id = ? AND departure_date = ?', 
          params[:origin_id], params[:destination_id], params[:departure_date])
  end

  # GET /flights/1 
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights 
  def create
  end

  # PATCH/PUT /flightss/1
  def update
  end

  # DELETE /flights/1 
  def destroy
  end

  private

  def search_params
    params.permit(:origin_id, :destination_id, :departure_date)
  end    
end
