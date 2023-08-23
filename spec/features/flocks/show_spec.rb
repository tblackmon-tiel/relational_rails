require 'rails_helper'

RSpec.describe "Flocks Show", type: :feature do
  describe "US 2" do
    it "displays a given parent record's attributes when visiting /flocks/:id" do
      flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
      flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)

      visit "/flocks/#{flock_1.id}"

      expect(page).to have_content(flock_1.name)
      expect(page).to have_content(flock_1.cage_number)
      expect(page).to have_content(flock_1.accepts_new_birds)
      
      visit "/flocks/#{flock_2.id}"

      expect(page).to have_content(flock_2.name)
      expect(page).to have_content(flock_2.cage_number)
      expect(page).to have_content(flock_2.accepts_new_birds)
    end
  end
end