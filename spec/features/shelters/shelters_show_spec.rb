require 'rails_helper'

RSpec.describe 'shelters show page feature', type: :feature do
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

    it 'can delete a shelter' do
      shelter1 = Shelter.create(name: "Mike's Shelter",
                                address: '1331 17th Street',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80202')

      visit "/shelters/#{shelter1.id}"

      click_button('Delete Shelter')

      expect(page).to have_no_content(shelter1.name)
    end
  end
end

RSpec.describe 'shelter show page links' do
  context 'as a page' do
    it 'has an edit button' do
      shelter1 = Shelter.create(name: "Mike's Shelter",
                                address: '1331 17th Street',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80202')

      visit "/shelters/#{shelter1.id}"

      click_button 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter1.id}/edit")
    end
  end
end
