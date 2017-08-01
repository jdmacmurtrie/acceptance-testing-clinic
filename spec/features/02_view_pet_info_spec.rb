require 'spec_helper'

feature "view pets show" do
  before :each do
    CSV.open("pets.csv", "ab") do |csv|
      csv << ["Garfield",21,"Orange"]
    end
  end

  after :each do
    CSV.open("pets.csv", "wb") do |csv|
      csv << ["name","age","color"]
    end
  end

  scenario "page should show the specific information for a pet" do
    visit "/"

    click_on "Garfield"

    expect(page).to have_content("Garfield")
    expect(page).to have_content("21")
    expect(page).to have_content("Orange")
  end
end
