require 'rails_helper'

RSpec.describe "Flocks Index", type: :feature do
  describe "US 1" do
    it "displays each parent record name when visiting /flocks" do
      flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
      flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)

      visit "/flocks"

      expect(page).to have_content(flock_1.name)
      expect(page).to have_content(flock_1.created_at)
      expect(page).to have_content(flock_2.name)
      expect(page).to have_content(flock_2.created_at)
    end
  end

  describe "US 6" do
    it "displays each parent record sorted by most recently created" do
      flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
      flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)
    end
  end
end