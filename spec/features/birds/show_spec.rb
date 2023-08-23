require 'rails_helper'

RSpec.describe "Birds Show", type: :feature do
  describe "US 4" do
    it "displays a given child record with attributes when visiting /birds/:id" do
      flock = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
      flock_id = flock.id
      bird_1 = Bird.create!(flock_id: flock_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
      bird_2 = Bird.create!(flock_id: flock_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)

      visit "/birds/#{bird_1.id}"

      expect(page).to have_content(bird_1.name)
      expect(page).to have_content(bird_1.flock_id)
      expect(page).to have_content(bird_1.band_id)
      expect(page).to have_content(bird_1.age)
      expect(page).to have_content(bird_1.is_bonded)

      visit "/birds/#{bird_2.id}"

      expect(page).to have_content(bird_2.name)
      expect(page).to have_content(bird_2.flock_id)
      expect(page).to have_content(bird_2.band_id)
      expect(page).to have_content(bird_2.age)
      expect(page).to have_content(bird_2.is_bonded)
    end
  end
end