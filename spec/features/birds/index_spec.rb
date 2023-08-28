require 'rails_helper'

RSpec.describe "Birds Index", type: :feature do
  before(:each) do
    @flock = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_id = @flock.id
    @bird_1 = Bird.create!(flock_id: @flock_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
    @bird_2 = Bird.create!(flock_id: @flock_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
  end

  describe "US 3" do
    it "displays each child record when visiting /birds" do
      visit "/birds"

      expect(page).to have_content(@bird_1.name)
      expect(page).to have_content(@bird_2.name)
    end
  end

  describe "US 8" do
    it "has a link to the Bird Index page" do
      visit "/birds"

      expect(page).to have_link('Return to all Birds', href: "/birds")
    end
  end
  
  describe "US 9" do
    it "has a link to the Flock Index page" do
      visit "/birds"

      expect(page).to have_link('Return to all Flocks', href: "/flocks")
    end
  end
end