class FlightsController < ApplicationController
  # GET /flights 
  def index
    @airport_cities = Airport.all.map { |a| [a.location ] }
    @flights = Flight.all.where
    @dates = Flight.all.map { |f| [f.departure_date.strftime("%m/%d/%Y")] }.uniq
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

end
