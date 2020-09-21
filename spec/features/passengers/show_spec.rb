require 'rails_helper'


RSpec.describe 'Passenger index page' do

  describe 'I see names of all passengers' do
    it 'And next to the passengers name I see the number of flights that the passenger has' do

      airline_1 = Airline.create(name: 'Blue & White Planes')
      flight_1 = Flight.create(number: 122, airline: airline_1)
      flight_2 = Flight.create(number: 124, airline: airline_1)
      passenger_1 = flight_1.passengers.create(name: "George Hanky", age: 12)
      passenger_2 = flight_1.passengers.create(name: "Timmy Hanky", age: 12)
      passenger_3 = flight_2.passengers.create(name: "Tom Tim", age: 38)
      passenger_4 = flight_2.passengers.create(name: "Lisa Carn", age: 53)
      visit "/passengers"

      within "#passenger-#{passenger_1.id}" do
        expect(page).to have_content(passenger_1.name)
        expect(page).to have_content("Number of flights: #{passenger_1.flights.length}")
      end

      within "#passenger-#{passenger_2.id}" do
        expect(page).to have_content(passenger_2.name)
        expect(page).to have_content("Number of flights: #{passenger_2.flights.length}")
      end

      within "#passenger-#{passenger_3.id}" do
        expect(page).to have_content(passenger_3.name)
        expect(page).to have_content("Number of flights: #{passenger_3.flights.length}")
      end

      within "#passenger-#{passenger_4.id}" do
        expect(page).to have_content(passenger_1.name)
        expect(page).to have_content("Number of flights: #{passenger_4.flights.length}")
      end
    end
  end
end
