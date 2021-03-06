require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  context 'as a user' do
    before :each do
      @shelter1 = Shelter.create(
        name: 'Limitless Reef',
        address: '1331 17th Street',
        city: 'Denver',
        state: 'CO',
        zip: '80202'
      )

      @shelter2 = Shelter.create(
        name: 'Whispering Forest',
        address: '150 Main Street',
        city: 'Hershey',
        state: 'PA',
        zip: '17033'
      )

      @pet1 = Pet.create(
        image: 'https://www.talenthounds.ca/wp-content/uploads/2014/02/1010297_10151682411488254_1369748570_n.jpg',
        name: 'Athena',
        description: 'butthead',
        age: '1',
        sex: 'female',
        status: false,
        shelter_id: @shelter1.id
      )

      @pet2 = Pet.create!(
        image: 'https://qph.fs.quoracdn.net/main-qimg-93bfd510cdebb550b6d46a2455d3c39a',
        name: 'Odell',
        description: 'good dog',
        age: '4',
        sex: 'male',
        status: false,
        shelter_id: @shelter2.id
      )
    end

    it 'can see names of shelters' do
      visit '/pets'

      expect(page).to have_css("img[src*='#{@pet1.image}']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet1.age)
      expect(page).to have_content(@pet2.age)
      expect(page).to have_content('F')
      expect(page).to have_content('M')
      expect(page).to have_content(@shelter1.name)
      expect(page).to have_content(@shelter2.name)
    end
  end
end
