require 'spec_helper'

feature "add pets" do
  after :each do
    CSV.open("pets.csv", "wb") do |csv|
      csv << ["name","age","color"]
    end
  end

  scenario "user adds a pet successfully in a new form page" do
    visit '/pets'

    expect(page).to have_field("Name")
    expect(page).to have_field("Color")
    expect(page).to have_field("Age")

    fill_in "Name" with: "Tom"
    fill_in "Age" with: "35"
    fill_in "Color" with: "Black"
    click_on "Submit"

    expect(page).to have_content("Tom")
    expect(page.current_path).to eq("/")
  end
end
