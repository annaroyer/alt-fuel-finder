require 'rails_helper'

describe 'As a user' do
  context 'When I visit "/"' do
    context 'And I fill in the search form with 80203 and I click "Locate"' do
      scenario 'Then I should be on page "/search" with parameters visible in the url' do
        visit '/'

        stations = File.open('./spec/fixtures/fuel_stations.json')
        stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL-API-KEY']}&location=80203&fuel_type=ELEC,LPG&limit=10")
        .to_return(status: 200, body: stations, headers: {})
        
        fill_in :q, with: '80203'
        click_on 'Locate'


        expect(current_path).to eq('/search')
        expect(page).to have_content('10 Closest Stations within 6 Miles')
        expect(page).to have_content("Name: UDR")
        expect(page).to have_content("Address: 800 Acoma St")
        expect(page).to have_content("Fuel Types: Electric")
        expect(page).to have_content("Access Times: 24 hours daily")
        expect(page).to have_content("Distance: 0.31422 miles")
      end
    end
  end
end
