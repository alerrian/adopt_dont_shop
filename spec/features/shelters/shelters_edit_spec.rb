require 'rails_helper'

RSpec.describe 'editing a shelter' do
  context 'as a user' do
    it 'can edit parameters of a shelter' do
      shelter1 = Shelter.create(name: "Mike's Shelter",
                                address: '1331 17th Street',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80202')

      visit "/shelters/#{shelter1.id}"

      expect(page).to have_content("Mike's Shelter")

      click_on 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

      fill_in 'Name', with: 'New Pet Shop Name'
      fill_in 'Address', with: '1234 Address Road'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'CO'
      fill_in 'Zip', with: '12345'

      click_on 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter1.id}")
      expect(page).to have_content('New Pet Shop Name')
      expect(page).to_not have_content("Mike's Shelter")
    end
  end
end
