require 'rails_helper'

RSpec.describe 'shelters index page' do
  context 'as a user' do
    it 'can see names of shelters' do
      shelter1 = Shelter.create(name: 'Limitless Reef')
      shelter2 = Shelter.create(name: 'Whispering Forest')

      visit '/shelters'

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
    end
  end
end
