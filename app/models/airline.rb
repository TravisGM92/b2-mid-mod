class Airline < ApplicationRecord
  validates_presence_of :name
  has_many :flights

  def unique_passengers
    flight_ids = Flight.where(airline_id: self.id).pluck(:id)
    passengers = Passenger.joins(:flights).where(flights: {id: flight_ids}).pluck(:name).uniq
  end
end
