class Passenger < ApplicationRecord
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights
  validates_presence_of :name, :age

  def number_of_flights
    Flight.joins(:passengers).where(passengers: {id: self.id}).count
  end
end
