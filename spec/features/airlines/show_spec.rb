require 'rails_helper'


RSpec.describe 'Airline show page' do

  describe 'it in more details' do
    describe 'it even more' do
      it "I see a unique list of passengers that have flights from that airline" do
        airline_1 = Airline.create(name: 'Blue & White Planes')
        airline_2 = Airline.create(name: 'Air Bulgaria')

        flight_1 = Flight.create(number: 122, airline: airline_1)
        flight_2 = Flight.create(number: 124, airline: airline_1)
        flight_3 = Flight.create(number: 124, airline: airline_2)

        passenger_1 = flight_1.passengers.create(name: "George Hanky", age: 12)
        passenger_2 = flight_1.passengers.create(name: "Timmy Hanky", age: 12)
        passenger_3 = flight_2.passengers.create(name: "Tom Tim", age: 38)
        passenger_4 = flight_2.passengers.create(name: "Lisa Carn", age: 53)

        passenger_5 = flight_3.passengers.create(name: "Tina Turner", age: 53)
        passenger_6 = flight_3.passengers.create(name: "Liza Fred", age: 53)
        passenger_7 = flight_1.passengers.create(name: "Lisa Carn", age: 53)
        
        visit "/airlines/#{airline_1.id}"
        expect(page).to have_content(passenger_1.name)
        expect(page).to have_content(passenger_2.name)
        expect(page).to have_content(passenger_3.name)
        expect(page).to have_content(passenger_4.name)
      end
    end
  end
end
