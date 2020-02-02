require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  before :each do
    @shelter1 = Shelter.create(
      name: 'Limitless Reef',
      address: '1331 17th Street',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )
  end

  it 'can create a pet for a shelter' do
    visit "/shelters/#{@shelter1.id}/pets"

    click_button 'Add new pet'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets/new")

    fill_in 'image', with: 'https://images-na.ssl-images-amazon.com/images/I/41c%2BPPhJGkL._AC_.jpg'
    fill_in 'name', with: 'Octavius'
    fill_in 'description', with: 'Derpy'
    fill_in 'age', with: '1'
    fill_in 'sex', with: 'male'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")
    expect(page).to have_content('Octavius')
  end
end
