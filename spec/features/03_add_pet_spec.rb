require 'spec_helper'

feature "add pets" do
  after :each do
    CSV.open("pets.csv", "wb") do |csv|
      csv << ["name","age","color"]
    end
  end

  scenario "user adds a pet successfully in a new form page" do
    visit '/'

    click_link 'Add new pet!'

    fill_in 'Name', with: 'Garfield'
    fill_in 'Age', with: '127389217398'
    fill_in 'Color', with: 'Blue'

    click_on 'Submit'

    expect(page).to have_content('Garfield')
    expect(page).to have_link('Garfield')
  end
end
