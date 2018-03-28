require 'rails_helper'

describe 'As a user' do
  context 'When I visit "/"' do
    context 'And I fill in the search form with 80203 and I click "Locate"' do
      scenario 'Then I should be on page "/search" with parameters visible in the url' do
        visit '/'

        fill_in :q, with: '80203'
        click_on 'Locate'

        expect(current_path).to eq('/search')
        expect(page).to have_content('10 Closest Stations within 6 Miles of 80203')
        expect(page).to have_content("Name: UDR")
        expect(page).to have_content("Address: 800 Acoma St")
        expect(page).to have_content("Fuel Types: Electric")
        expect(page).to have_content("Access Times: 24 hours daily")
        expect(page).to have_content("Distance: 0.31422 miles")
      end
    end
  end
end

#'Then I should see a list of the 10 closest stations within 6 miles sorted by distance'
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
