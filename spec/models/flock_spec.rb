require 'rails_helper'

RSpec.describe Flock, type: :model do
  describe "relationships" do
    it { should have_many :birds }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cage_number }
    it { should allow_value(true).for(:accepts_new_birds) }
    it { should allow_value(false).for(:accepts_new_birds) }
  end

  describe "instance methods" do
    describe "get_bird_count" do
      it "returns the number of birds associated with the flock" do
        flock = Flock.create!(name: "Test Flock", cage_number: 1, accepts_new_birds: true)
        flock_id = flock.id
        bird1 = Bird.create!(name: "Kiwi", flock_id: flock_id, band_id: 1, age: 5, is_bonded: true)
        bird2 = Bird.create!(name: "Chicken", flock_id: flock_id, band_id: 2, age: 6, is_bonded: true)

        expect(flock.get_bird_count).to eq(2)
      end
    end
  end
end