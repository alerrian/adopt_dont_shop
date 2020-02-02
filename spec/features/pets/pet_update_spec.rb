require 'rails_helper'

RSpec.describe 'editing a pet', type: :feature do
  context 'as a visitor' do
    before :each do
      @shelter1 = Shelter.create(
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

    it 'can edit parameters of a pet' do
      visit "/pets/#{@pet1.id}"

      click_on 'Update Pet'

      expect(current_path).to eq("/pets/#{@pet1.id}/edit")

      fill_in 'name', with: 'Oscar'
      fill_in 'image', with: 'https://i.ytimg.com/vi/DgdMV3IczYY/hqdefault.jpg'
      fill_in 'description', with: 'Edited desc'
      fill_in 'age', with: '1'
      fill_in 'sex', with: 'female'

      click_on 'Update'

      expect(current_path).to eq("/pets/#{@pet1.id}")
      expect(page).to have_content('Oscar')
      expect(page).to have_content('F')
    end
  end
end
