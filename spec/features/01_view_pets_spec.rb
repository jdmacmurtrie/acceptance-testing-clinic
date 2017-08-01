require 'spec_helper'

feature "view pets index" do
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

  scenario "user visits /pets path and sees list of pets" do
    visit "/pets"

    expect(page.status_code).to_not eq(500)
    expect(page).to have_content("Garfield")
    expect(page).to have_link("Garfield")
  end
end
