require 'rails_helper'

RSpec.describe "Flocks Show", type: :feature do
  before(:each) do
    @flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)
    @flock_1_id = @flock_1.id
    @flock_2_id = @flock_2.id
    @bird_1 = Bird.create!(flock_id: @flock_1_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
    @bird_2 = Bird.create!(flock_id: @flock_1_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
    @bird_3 = Bird.create!(flock_id: @flock_2_id, name: "Coco", band_id: 10, age: 4, is_bonded: true)
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

  describe "US 10" do
    it "has a link to the Flock_Birds Index page" do
      visit "/flocks/#{@flock_1.id}"

      expect(page).to have_link('2', href: "/flocks/#{@flock_1.id}/birds")
    end
  end

  describe "US 12" do
    it "has a link to update the currently shown flock" do
      visit "/flocks/#{@flock_1.id}"

      expect(page).to have_link('Update Flock', href: "/flocks/#{@flock_1.id}/edit")
    end
  end

  describe "US 19" do
    it "has a button to delete the parent" do
      visit "/flocks/#{@flock_1.id}"

      expect(page).to have_button('Delete Flock')
    end

    it "deletes the flock successfully when the delete button is used and redirects to the flock index page" do
      visit "/flocks/#{@flock_1.id}"

      click_button("Delete Flock")

      expect(page).to have_current_path("/flocks")
      expect(page).to_not have_content("name: #{@flock_1.name}")
      expect(page).to_not have_content("cage_number: #{@flock_1.cage_number}")
      expect(page).to_not have_content("accepts_new_birds: #{@flock_1.accepts_new_birds}")
    end

    it "deletes birds associated to the flock when the delete button is used" do
      visit "/flocks/#{@flock_1.id}"
      click_button("Delete Flock")
      visit "/birds"

      expect(page).to_not have_content("name: #{@bird_1.name}")
      expect(page).to_not have_content("flock_id: #{@bird_1.flock_id}")
      expect(page).to_not have_content("band_id: #{@bird_1.band_id}")
      expect(page).to_not have_content("name: #{@bird_2.name}")
      expect(page).to_not have_content("flock_id: #{@bird_2.flock_id}")
      expect(page).to_not have_content("band_id: #{@bird_2.band_id}")
    end
  end
end