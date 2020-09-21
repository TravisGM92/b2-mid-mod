require 'rails_helper'


RSpec.describe 'Flights index page' do

  describe 'it in more details' do
    describe 'it even more' do
      it "I see each flight's number" do
        airline_1 = Airline.create(name: 'Blue & White Planes')
        flight_1 = Flight.create(number: 122, airline: airline_1)
        flight_2 = Flight.create(number: 124, airline: airline_1)
        passenger_1 = flight_1.passengers.create(name: "George Hanky", age: 12)
        passenger_2 = flight_1.passengers.create(name: "Timmy Hanky", age: 12)
        passenger_3 = flight_2.passengers.create(name: "Tom Tim", age: 38)
        passenger_4 = flight_2.passengers.create(name: "Lisa Carn", age: 53)
        visit '/flights'

        expect(page).to have_content(flight_1.number)
        expect(page).to have_content(flight_2.number)
      end

      it 'And under each flight number I see the names of all that flights passengers' do
        airline_1 = Airline.create(name: 'Blue & White Planes')
        flight_1 = Flight.create(number: 122, airline: airline_1)
        flight_2 = Flight.create(number: 124, airline: airline_1)
        passenger_1 = flight_1.passengers.create(name: "George Hanky", age: 12)
        passenger_2 = flight_1.passengers.create(name: "Timmy Hanky", age: 12)
        passenger_3 = flight_2.passengers.create(name: "Tom Tim", age: 38)
        passenger_4 = flight_2.passengers.create(name: "Lisa Carn", age: 53)
        visit '/flights'

        within "#flight-#{flight_1.id}" do
          expect(page).to have_content(passenger_1.name)
          expect(page).to have_content(passenger_2.name)
        end
        within "#flight-#{flight_2.id}" do
          expect(page).to have_content(passenger_3.name)
          expect(page).to have_content(passenger_4.name)
        end
      end

      describe "Each passenger has a link next to their name to remove that passenger from that flight" do
        describe "When I click that link I'm returned to the flights index page" do
          it "and I no longer see that passenger listed under that flight" do
            airline_1 = Airline.create(name: 'Blue & White Planes')
            flight_1 = Flight.create(number: 122, airline: airline_1)
            flight_2 = Flight.create(number: 124, airline: airline_1)
            passenger_1 = flight_1.passengers.create(name: "George Hanky", age: 12)
            passenger_2 = flight_1.passengers.create(name: "Timmy Hanky", age: 12)
            passenger_3 = flight_2.passengers.create(name: "Tom Tim", age: 38)
            passenger_4 = flight_2.passengers.create(name: "Lisa Carn", age: 53)
            visit "/flights"
            
            expect(page).to have_link("Remove #{passenger_1.name} from flight")
            click_link("Remove #{passenger_1.name} from flight")
            expect(current_path).to eq("/flights")
            expect(page).to_not have_content("#{passenger_1.name}")

          end
        end
      end
    end
  end
end
