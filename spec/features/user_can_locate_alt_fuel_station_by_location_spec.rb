require 'rails_helper'

describe 'As a user' do
  context 'When I visit "/"' do
    context 'And I fill in the search form with 80203 and I click "Locate"' do
      scenario 'Then I should be on page "/search" with parameters visible in the url' do
        visit '/'

        fill_in 'Search', with: '80203'

        expect(current_path).to eq('/search?q=80203')
      end
    end
  end
end
#
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times