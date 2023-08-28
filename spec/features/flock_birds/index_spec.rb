require 'rails_helper'

RSpec.describe "Flock_Birds Index", type: :feature do
  before(:each) do
    @flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)
    @flock_1_id = @flock_1.id
    @flock_2_id = @flock_2.id
    @bird_1 = Bird.create!(flock_id: @flock_1_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
    @bird_2 = Bird.create!(flock_id: @flock_1_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
    @bird_3 = Bird.create!(flock_id: @flock_2_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
  end
  
  describe "US 5" do
    it "displays a given parent's children's attributes when visiting /flocks/:id/birds" do
      visit "/flocks/#{@flock_1.id}/birds"

      expect(page).to have_content(@bird_1.name)
      expect(page).to have_content(@bird_1.flock_id)
      expect(page).to have_content(@bird_1.band_id)
      expect(page).to have_content(@bird_1.age)
      expect(page).to have_content(@bird_1.is_bonded)
      expect(page).to have_content(@bird_2.name)
      expect(page).to have_content(@bird_2.flock_id)
      expect(page).to have_content(@bird_2.band_id)
      expect(page).to have_content(@bird_2.age)
      expect(page).to have_content(@bird_2.is_bonded)
      
      visit "/flocks/#{@flock_2.id}/birds"

      expect(page).to have_content(@bird_3.name)
      expect(page).to have_content(@bird_3.flock_id)
      expect(page).to have_content(@bird_3.band_id)
      expect(page).to have_content(@bird_3.age)
      expect(page).to have_content(@bird_3.is_bonded)
    end
  end
end