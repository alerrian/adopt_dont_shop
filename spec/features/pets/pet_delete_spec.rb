require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
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

  it 'can delete a pet' do
    visit "/pets/#{@pet1.id}"

    click_button 'Delete Pet'

    expect(current_path).to eq('/pets')
    expect(page).to have_no_content(@pet1.name) 
  end
end
