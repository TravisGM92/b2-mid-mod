class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def destroy
    pass = Passenger.find(params[:id])
    PassengerFlight.where(passenger_id: params[:id])[0].destroy
    redirect_to("/flights")
  end
end
