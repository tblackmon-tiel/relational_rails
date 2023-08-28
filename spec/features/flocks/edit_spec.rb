require 'rails_helper'

RSpec.describe "Flocks Edit" do
  before(:each) do
    @flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
  end

  describe "US 8" do
    it "has a link to the Bird Index page" do
      visit "/flocks"

      expect(page).to have_link('Return to all Birds', href: "/birds")
    end
  end
  
  describe "US 9" do
    it "has a link to the Flock Index page" do
      visit "/flocks"

      expect(page).to have_link('Return to all Flocks', href: "/flocks")
    end
  end
  
  describe "US 12" do
    it "has a form containing the flock's attributes" do
      visit "/flocks/#{@flock_1.id}/edit"

      expect(find_field("name").value).to eq(@flock_1.name)
      expect(find_field("cage_number").value).to eq(@flock_1.cage_number.to_s)
      expect(find_field("accepts_new_birds").value).to eq(@flock_1.accepts_new_birds.to_s)
      expect(page).to have_button("Update Flock")
    end

    it "updates the flock and redirects to the flock show page on submit" do
      visit "/flocks/#{@flock_1.id}/edit"

      fill_in("name", with: "Not Chicken's Flock")
      fill_in("cage_number", with: 1)
      fill_in("accepts_new_birds", with: false)
      click_button("Update Flock")

      expect(page).to have_current_path("/flocks/#{@flock_1.id}")

      expect(page).to have_content("name: Not Chicken's Flock")
      expect(page).to have_content("cage_number: 1")
      expect(page).to have_content("accepts_new_birds: false")
    end
  end
end