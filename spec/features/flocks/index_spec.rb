require 'rails_helper'

RSpec.describe "Flocks Index", type: :feature do
  before(:each) do
    @flock_1 = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_2 = Flock.create!(name: "Random Flock", cage_number: 3, accepts_new_birds: true)
    @flock_3 = Flock.create!(name: "A Third Flock", cage_number: 3, accepts_new_birds: true)
  end
  
  describe "US 1" do
    it "displays each parent record name when visiting /flocks" do
      visit "/flocks"

      expect(page).to have_content(@flock_1.name)
      expect(page).to have_content(@flock_1.created_at)
      expect(page).to have_content(@flock_2.name)
      expect(page).to have_content(@flock_2.created_at)
    end
  end

  describe "US 6" do
    it "displays each parent record sorted by most recently created" do
      visit "/flocks"

      expect("A Third Flock").to appear_before("Random Flock", only_text: true)
      expect("Chicken's Flock").to_not appear_before("Random Flock", only_text: true)
    end
  end

  describe "US 8" do
    it "has a link to the Bird Index page" do
      visit "/flocks"

      expect(page).to have_link('Return to all Birds', href: "/birds")
    end
  end
  
  describe "US 9" do
    it "has a link to the Flock Index page" do
      visit "/flocks"

      expect(page).to have_link('Return to all Flocks', href: "/flocks")
    end
  end

  describe "US 11" do
    it "has a link to the Flock New (creation) page" do
      visit "/flocks"

      expect(page).to have_link('Create a new Flock', href: "/flocks/new")
    end
  end
end