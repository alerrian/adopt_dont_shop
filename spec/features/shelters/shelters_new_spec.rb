require 'rails_helper'

RSpec.describe 'new shelter creation' do
  context 'as a user' do
    it 'can create a new shelter' do
      visit '/shelters/new'

      fill_in 'shelter[name]', with: 'New Shelter Name'
      fill_in 'shelter[address]', with: '999 E. Road'
      fill_in 'shelter[city]', with: 'City Name'
      fill_in 'shelter[state]', with: 'State Abbrev'
      fill_in 'shelter[zip]', with: 'Zip Code'

      click_button('shelter_submit')

      expect(current_path).to eq('/shelters')
      expect(page).to have_content('New Shelter Name')
    end
  end
end
