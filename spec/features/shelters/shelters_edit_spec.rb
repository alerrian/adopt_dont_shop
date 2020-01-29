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

      click_link('Edit')

      fill_in 'shelter[name]', with: 'New Pet Shop Name'

      expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

      click_button('shelter_submit')
      expect(page).to have_content('New Pet Shop Name')
    end
  end
end
