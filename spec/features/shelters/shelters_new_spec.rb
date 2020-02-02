require 'rails_helper'

RSpec.describe 'new shelter creation', type: :feature do
  context 'as a user' do
    it 'can create a new shelter' do
      visit '/shelters/new'

      fill_in 'name', with: 'New Shelter Name'
      fill_in 'address', with: '999 E. Road'
      fill_in 'city', with: 'City Name'
      fill_in 'state', with: 'State Abbrev'
      fill_in 'zip', with: 'Zip Code'

      click_button('Create Shelter')

      expect(current_path).to eq('/shelters')
      expect(page).to have_content('New Shelter Name')
    end
  end
end
