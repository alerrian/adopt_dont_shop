require 'rails_helper'

RSpec.describe 'pet show page', type: :feature do
  context 'as a visitor' do
    before :each do
      @shelter1 = Shelter.create!(
        name: 'Limitless Reef',
        address: '1331 17th Street',
        city: 'Denver',
        state: 'CO',
        zip: '80202'
      )

      @pet1 = Pet.create!(
        image: 'https://www.talenthounds.ca/wp-content/uploads/2014/02/1010297_10151682411488254_1369748570_n.jpg',
        name: 'Athena',
        description: 'butthead',
        age: '1',
        sex: 'female',
        status: false,
        shelter_id: @shelter1.id
      )
    end

    it 'can see an individual pets information' do
      visit "/pets/#{@pet1.id}"

      expect(page).to have_css("img[src*='#{@pet1.image}']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.description)
      expect(page).to have_content(@pet1.age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@pet1.status)
    end
  end
end
