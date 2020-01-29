require 'rails_helper'

RSpec.describe 'new shelter creation' do
  context 'as a user' do
    scenario 'can create a new shelter' do
      visit '/shelters/new'
      within('form') do
        fill_in 'shelter[name]', with: 'New Shelter Name'
        fill_in 'shelter[address]', with: '999 E. Road'
        fill_in 'shelter[city]', with: 'City Name'
        fill_in 'shelter[state]', with: 'State Abbrev'
        fill_in 'shelter[zip]', with: 'Zip Code'
      end

      click_on 'submit'
      expect(page).to have_content 'New Shelter Name'
    end
  end
end
