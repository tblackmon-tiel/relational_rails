require 'rails_helper'

RSpec.describe "Flocks New", type: :feature do
  describe "US 11" do
    it "has a form to create a new flock" do
      visit "/flocks/new"
    
      expect(page).to have_field("name")
      expect(page).to have_field("cage_number")
      expect(page).to have_field("accepts_new_birds")
      expect(page).to have_button("Create Flock")
    end

    it "adds a flock to the database when the form is submitted and redirects to the index page" do
      visit "/flocks/new"

      fill_in("name", with: "I'm a Test Flock")
      fill_in("cage_number", with: 17)
      fill_in("accepts_new_birds", with: true)
      click_button("Create Flock")

      expect(page).to have_current_path("/flocks")

      expect(page).to have_content("I'm a Test Flock")
    end
  end
end