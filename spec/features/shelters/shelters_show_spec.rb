require 'rails_helper'

RSpec.describe 'shelters show page', type: :feature do
  context 'as a user' do
    it 'can see all data pertaining to shelters' do
      shelter1 = Shelter.create(name: "Mike's Shelter",
                                address: '1331 17th Street',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80202')

      visit "/shelters/#{shelter1.id}"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter1.address)
      expect(page).to have_content(shelter1.city)
      expect(page).to have_content(shelter1.state)
      expect(page).to have_content(shelter1.zip)
    end

    it 'has an edit button' do
      shelter1 = Shelter.create(name: "Mike's Shelter",
                                address: '1331 17th Street',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80202')

      visit "/shelters/#{shelter1.id}"

      expect(page).to have_link('Edit', href: "/shelters/#{shelter1.id}/edit")
    end
  end
end
