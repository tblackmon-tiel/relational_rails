require 'rails_helper'

RSpec.describe "Flocks Show", type: :feature do
  before(:each) do
    @flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)
    @flock_1_id = @flock_1.id
    @flock_2_id = @flock_2.id
    @bird_1 = Bird.create!(flock_id: @flock_1_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
    @bird_2 = Bird.create!(flock_id: @flock_1_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
    @bird_3 = Bird.create!(flock_id: @flock_2_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
  end

  describe "US 2" do
    it "displays a given parent record's attributes when visiting /flocks/:id" do
      visit "/flocks/#{@flock_1.id}"

      expect(page).to have_content(@flock_1.name)
      expect(page).to have_content(@flock_1.cage_number)
      expect(page).to have_content(@flock_1.accepts_new_birds)
      
      visit "/flocks/#{@flock_2.id}"

      expect(page).to have_content(@flock_2.name)
      expect(page).to have_content(@flock_2.cage_number)
      expect(page).to have_content(@flock_2.accepts_new_birds)
    end
  end

  describe "US 7" do
    it "shows the number of birds associated with the flock" do
      visit "/flocks/#{@flock_1.id}"

      expect(page).to have_content("This flock contains 2 birds.")

      visit "/flocks/#{@flock_2.id}"
      
      expect(page).to have_content("This flock contains 1 birds.")
    end
  end

  describe "US 8" do
    it "has a link to the Bird Index page" do
      visit "/flocks/#{@flock_1.id}"

      expect(page).to have_link('Return to all Birds', href: "/birds")
    end
  end
  
  describe "US 9" do
    it "has a link to the Flock Index page" do
      visit "/flocks/#{@flock_1.id}"

      expect(page).to have_link('Return to all Flocks', href: "/flocks")
    end
  end
end