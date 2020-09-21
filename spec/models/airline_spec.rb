require 'rails_helper'

describe Airline, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :flights }
  end

  describe 'instance method' do
    it '.unique_passengers' do
      airline_1 = Airline.create(name: 'Blue & White Planes')
      airline_2 = Airline.create(name: 'Air Bulgaria')

      flight_1 = airline_1.flights.create(number: 122)
      flight_2 = airline_1.flights.create(number: 124)
      flight_3 = airline_2.flights.create(number: 124)

      passenger_1 = flight_1.passengers.create(name: "George Hanky", age: 12)
      passenger_2 = flight_1.passengers.create(name: "Timmy Hanky", age: 12)
      passenger_3 = flight_2.passengers.create(name: "Tom Tim", age: 38)
      passenger_4 = flight_2.passengers.create(name: "Lisa Carn", age: 53)

      passenger_5 = flight_3.passengers.create(name: "Tina Turner", age: 53)
      passenger_6 = flight_3.passengers.create(name: "Liza Fred", age: 53)
      passenger_7 = flight_1.passengers.create(name: "Lisa Carn", age: 53)

      expected = [passenger_1.name, passenger_2.name, passenger_4.name, passenger_3.name]
      expect(airline_1.unique_passengers).to eq(expected)
    end
  end
end
