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

    @shelter2 = Shelter.create(
      name: 'Whispering Forest',
      address: '150 Main Street',
      city: 'Hershey',
      state: 'PA',
      zip: '17033'
    )
  end

  it 'can edit a shelter from index' do
    visit '/shelters'

    expect(page).to have_button("Update #{@shelter1.name}")
    expect(page).to have_button("Update #{@shelter2.name}")

    click_button "Update #{@shelter1.name}"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")
  end

  it 'can delete a shelter from index' do
    visit '/shelters'

    expect(page).to have_button("Delete #{@shelter1.name}")
    expect(page).to have_button("Delete #{@shelter2.name}")

    click_button "Delete #{@shelter1.name}"

    expect(current_path).to eq('/shelters')
    expect(page).to have_no_content(@shelter1.name)
  end
end
