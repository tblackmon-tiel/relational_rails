require 'rails_helper'

RSpec.describe "Birds Show", type: :feature do
  before(:each) do
    @flock = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_id = @flock.id
    @bird_1 = Bird.create!(flock_id: @flock_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
    @bird_2 = Bird.create!(flock_id: @flock_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
  end

  describe "US 4" do
    it "displays a given child record with attributes when visiting /birds/:id" do
      

      visit "/birds/#{@bird_1.id}"

      expect(page).to have_content(@bird_1.name)
      expect(page).to have_content(@bird_1.flock_id)
      expect(page).to have_content(@bird_1.band_id)
      expect(page).to have_content(@bird_1.age)
      expect(page).to have_content(@bird_1.is_bonded)

      visit "/birds/#{@bird_2.id}"

      expect(page).to have_content(@bird_2.name)
      expect(page).to have_content(@bird_2.flock_id)
      expect(page).to have_content(@bird_2.band_id)
      expect(page).to have_content(@bird_2.age)
      expect(page).to have_content(@bird_2.is_bonded)
    end
  end

  describe "US 8" do
    it "has a link to the Bird Index page" do
      visit "/birds/#{@bird_1.id}"

      expect(page).to have_link('Return to all Birds', href: "/birds")
    end
  end
  
  describe "US 9" do
    it "has a link to the Flock Index page" do
      visit "/birds/#{@bird_1.id}"

      expect(page).to have_link('Return to all Flocks', href: "/flocks")
    end
  end

  describe "US 14" do
    it "has a link to the bird edit page" do
      visit "/birds/#{@bird_1.id}"

      expect(page).to have_link('Update Bird', href: "/birds/#{@bird_1.id}/edit")
    end
  end

  describe "US 20" do
    it "has a button to delete the bird" do
      visit "/birds/#{@bird_1.id}"

      expect(page).to have_button('Delete Bird')
    end

    it "deletes the bird successfully when the delete button is used and redirects to the bird index page" do
      visit "/birds/#{@bird_1.id}"

      click_button("Delete Bird")

      expect(page).to have_current_path("/birds")
      expect(page).to_not have_content("name: #{@bird_1.name}")
      expect(page).to_not have_content("age: #{@bird_1.age}")
      expect(page).to_not have_content("band_id: #{@bird_1.band_id}")
    end
  end
end