require 'rails_helper'

RSpec.describe "Birds Edit" do
  before(:each) do
    @flock = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
    @flock_2 = Flock.create!(name: "Kiwi's Flock", cage_number: 2, accepts_new_birds: true)
    @flock_id = @flock.id
    @flock_2_id = @flock_2.id
    @bird_1 = Bird.create!(flock_id: @flock_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
  end

  describe "US 14" do
    it "has a form filled in with the current bird's attributes" do
      visit "/birds/#{@bird_1.id}/edit"

      expect(find_field("name").value).to eq(@bird_1.name)
      expect(find_field("flock_id").value).to eq(@bird_1.flock_id.to_s)
      expect(find_field("band_id").value).to eq(@bird_1.band_id.to_s)
      expect(find_field("age").value).to eq(@bird_1.age.to_s)
      expect(find_field("is_bonded").value).to eq(@bird_1.is_bonded.to_s)
      expect(page).to have_button("Update Bird")
    end

    it "updates the bird and redirects to the bird's show page on submit" do
      visit "/birds/#{@bird_1.id}/edit"

      fill_in("name", with: "New Chicken")
      fill_in("flock_id", with: "#{@flock_2_id}")
      fill_in("band_id", with: "300")
      fill_in("age", with: "7")
      fill_in("is_bonded", with: "false")
      click_button("Update Bird")

      expect(page).to have_current_path("/birds/#{@bird_1.id}")

      expect(page).to have_content("New Chicken")
      expect(page).to have_content("#{@flock_2_id}")
      expect(page).to have_content("300")
      expect(page).to have_content("7")
      expect(page).to have_content("is_bonded: false")
    end
  end
end