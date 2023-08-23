require 'rails_helper'

RSpec.describe "Flocks Index", type: :feature do
  describe "US 1" do
    it "displays each parent record name when visiting /flocks" do
      flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
      flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)

      visit "/flocks"

      expect(page).to have_content(flock_1.name)
      expect(page).to have_content(flock_2.name)
    end
  end
end