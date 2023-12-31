require 'rails_helper'

RSpec.describe "Flock_Birds Index", type: :feature do
  before(:each) do
    @flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: false)
    @flock_1_id = @flock_1.id
    @flock_2_id = @flock_2.id
    @bird_1 = Bird.create!(flock_id: @flock_1_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
    @bird_2 = Bird.create!(flock_id: @flock_1_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
    @bird_3 = Bird.create!(flock_id: @flock_1_id, name: "Coco", band_id: 10, age: 4, is_bonded: true)
    @bird_4 = Bird.create!(flock_id: @flock_2_id, name: "Hiccup", band_id: 12, age: 10, is_bonded: false)
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

      expect(page).to have_content(@bird_4.name)
      expect(page).to have_content(@bird_4.flock_id)
      expect(page).to have_content(@bird_4.band_id)
      expect(page).to have_content(@bird_4.age)
      expect(page).to have_content(@bird_4.is_bonded)
    end
  end

  describe "US 8" do
    it "has a link to the Bird Index page" do
      visit "/flocks/#{@flock_1.id}/birds"

      expect(page).to have_link('Return to all Birds', href: "/birds")
    end
  end
  
  describe "US 9" do
    it "has a link to the Flock Index page" do
      visit "/flocks/#{@flock_1.id}/birds"

      expect(page).to have_link('Return to all Flocks', href: "/flocks")
    end
  end

  describe "US 13" do
    it "has a link to the flock_birds new (creation) page" do
      visit "/flocks/#{@flock_1.id}/birds"

      expect(page).to have_link("Add a Bird", href: "/flocks/#{@flock_1.id}/birds/new")
    end
  end

  describe "US 16" do
    it "has a link to sort birds alphabetically" do
      visit "/flocks/#{@flock_1.id}/birds"

      expect(page).to have_link("Sort Birds Alphabetically", href: "/flocks/#{@flock_1.id}/birds?sort_alpha=true")
    end

    it "sorts the birds alphabetically once the link is clicked" do
      visit "/flocks/#{@flock_1.id}/birds"

      click_link("Sort Birds Alphabetically")
      expect(page).to have_current_path("/flocks/#{@flock_1.id}/birds?sort_alpha=true")

      expect("Chicken").to appear_before("Coco", only_text: true)
      expect("Coco").to appear_before("Kiwi", only_text: true)
    end
  end

  describe "US 18" do
    it "has a link for each bird to visit the bird's edit page" do
      visit "/flocks/#{@flock_1.id}/birds"

      expect(page).to have_link('Update Bird', href: "/birds/#{@bird_1.id}/edit")
      expect(page).to have_link('Update Bird', href: "/birds/#{@bird_2.id}/edit")
      expect(page).to have_link('Update Bird', href: "/birds/#{@bird_3.id}/edit")
    end
  end

  describe "US 21" do
    it "has a form to return only records over a given threshold" do
      visit "/flocks/#{@flock_1.id}/birds"

      expect(page).to have_field("age_filter")
      expect(page).to have_button("Apply Age Filter")
      expect(page).to have_content("name: #{@bird_1.name}")
      expect(page).to have_content("band_id: #{@bird_1.band_id}")
      expect(page).to have_content("is_bonded: #{@bird_1.is_bonded}")
      expect(page).to have_content("name: #{@bird_2.name}")
      expect(page).to have_content("band_id: #{@bird_2.band_id}")
      expect(page).to have_content("is_bonded: #{@bird_2.is_bonded}")
      expect(page).to have_content("name: #{@bird_3.name}")
      expect(page).to have_content("band_id: #{@bird_3.band_id}")
      expect(page).to have_content("is_bonded: #{@bird_3.is_bonded}")

      fill_in("age_filter", with: 5)
      click_button("Apply Age Filter")

      expect(page.current_path).to include("/flocks/#{@flock_1.id}/birds")
      expect(page).to have_content("name: #{@bird_1.name}")
      expect(page).to have_content("band_id: #{@bird_1.band_id}")
      expect(page).to have_content("is_bonded: #{@bird_1.is_bonded}")
      expect(page).to have_content("name: #{@bird_2.name}")
      expect(page).to have_content("band_id: #{@bird_2.band_id}")
      expect(page).to have_content("is_bonded: #{@bird_2.is_bonded}")
      expect(page).to_not have_content("name: #{@bird_3.name}")
      expect(page).to_not have_content("band_id: #{@bird_3.band_id}")
    end
  end
end