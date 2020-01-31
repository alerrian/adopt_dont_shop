require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  context 'as a user' do
    it 'can see names of shelters' do
      shelter1 = Shelter.create(name: "Limitless Reef",
                                address: '1331 17th Street',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80202')

      shelter2 = Shelter.create(name: "Whispering Forest",
                                address: '150 Main Street',
                                city: 'Hershey',
                                state: 'PA',
                                zip: '17033')

      visit '/shelters'

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
    end
  end
end
