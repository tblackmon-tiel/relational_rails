require 'rails_helper'

RSpec.describe "Flock_Birds New" do
  before(:each) do
    @flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
  end

  describe "US 13" do
    it "has a form to create a new bird within a flock" do
      visit "/flocks/#{@flock_1.id}/birds/new"
    
      expect(page).to have_field("name")
      expect(page).to have_field("band_id")
      expect(page).to have_field("age")
      expect(page).to have_field("is_bonded")
      expect(page).to have_button("Create Bird")
    end

    it "adds a flock to the database when the form is submitted and redirects to the index page" do
      visit "/flocks/#{@flock_1.id}/birds/new"

      fill_in("name", with: "Test Bird")
      fill_in("band_id", with: 17)
      fill_in("age", with: 5)
      fill_in("is_bonded", with: false)
      click_button("Create Bird")

      expect(page).to have_current_path("/flocks/#{@flock_1.id}/birds")

      expect(page).to have_content("Test Bird")
      expect(page).to have_content("17")
      expect(page).to have_content("5")
      expect(page).to have_content("false")
    end
  end
end