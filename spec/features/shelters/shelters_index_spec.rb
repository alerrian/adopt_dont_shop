require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  context 'as a user' do
    it 'can see names of shelters' do
      shelter1 = Shelter.create(name: 'Limitless Reef')
      shelter2 = Shelter.create(name: 'Whispering Forest')

      visit '/shelters'

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
    end

    it 'has a link to create a new shelter' do
      visit '/shelters'

      expect(page).to have_link('Create a new Shelter', href: '/shelters/new')
    end
  end
end
