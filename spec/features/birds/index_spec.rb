require 'rails_helper'

RSpec.describe "Birds Index", type: :feature do
  describe "US 3" do
    it "displays each child record when visiting /birds" do
      flock = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
      flock_id = flock.id
      bird_1 = Bird.create!(flock_id: flock_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
      bird_2 = Bird.create!(flock_id: flock_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)

      visit "/birds"

      expect(page).to have_content(bird_1.name)
      expect(page).to have_content(bird_2.name)
    end
  end
end