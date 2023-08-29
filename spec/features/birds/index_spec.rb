require 'rails_helper'

RSpec.describe "Birds Index", type: :feature do
  before(:each) do
    @flock = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_id = @flock.id
    @bird_1 = Bird.create!(flock_id: @flock_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
    @bird_2 = Bird.create!(flock_id: @flock_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
    @bird_3 = Bird.create!(flock_id: @flock_id, name: "Not Coco", band_id: 10, age: 4, is_bonded: false)
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

  describe "US 15" do
    it "only shows birds who have an is_bonded value of true" do
      visit "/birds"

      expect(page).to have_content("name: #{@bird_1.name}")
      expect(page).to have_content("band_id: #{@bird_1.band_id}")
      expect(page).to have_content("name: #{@bird_2.name}")
      expect(page).to have_content("band_id: #{@bird_2.band_id}")
      expect(page).to_not have_content("name: #{@bird_3.name}")
      expect(page).to_not have_content("band_id: #{@bird_3.band_id}")
    end
  end

  describe "US 18" do
    it "has a link for each bird to visit the bird edit page" do
      visit "/birds"

      expect(page).to have_link('Update Bird', href: "/birds/#{@bird_1.id}/edit")
      expect(page).to have_link('Update Bird', href: "/birds/#{@bird_2.id}/edit")
      expect(page).to_not have_link('Update Bird', href: "/birds/#{@bird_3.id}/edit")
    end
  end

  describe "US 23" do
    it "has a button beside each bird to delete the bird" do
      visit "/birds"

      expect(page).to have_button("Delete #{@bird_1.name}")
      expect(page).to have_button("Delete #{@bird_2.name}")
      expect("Chicken").to appear_before("Delete #{@bird_1.name}", only_text: true)
      expect("Kiwi").to appear_before("Delete #{@bird_2.name}", only_text: true)
    end

    it "deletes the bird when pressed" do
      visit "/birds"

      click_button("Delete #{@bird_2.name}")

      expect(page).to have_current_path("/birds")
      expect(page).to have_content("name: #{@bird_1.name}")
      expect(page).to have_content("band_id: #{@bird_1.band_id}")
      expect(page).to have_content("age: #{@bird_1.age}")
      expect(page).to_not have_content("name: #{@bird_2.name}")
      expect(page).to_not have_content("band_id: #{@bird_2.band_id}")
      expect(page).to_not have_content("age: #{@bird_2.age}")
    end
  end
end