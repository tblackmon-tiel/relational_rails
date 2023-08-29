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
    before(:each) do
      @flock_2 = Flock.create!(name: "Test Flock 2", cage_number: 2, accepts_new_birds: true)
      @flock = Flock.create!(name: "Test Flock", cage_number: 1, accepts_new_birds: true)
      @flock_3  = Flock.create!(name: "Test Flock 3", cage_number: 1, accepts_new_birds: true)
      @flock_id = @flock.id
      @flock_2_id = @flock_2.id
      @flock_3_id = @flock_3.id
      @bird1 = Bird.create!(name: "Kiwi", flock_id: @flock_id, band_id: 1, age: 5, is_bonded: true)
      @bird2 = Bird.create!(name: "Chicken", flock_id: @flock_id, band_id: 2, age: 6, is_bonded: true)
      @bird3 = Bird.create!(name: "Coco", flock_id: @flock_id, band_id: 3, age: 4, is_bonded: true)
      @bird4 = Bird.create!(name: "Bird 4", flock_id: @flock_2_id, band_id: 4, age: 4, is_bonded: true)
      @bird5 = Bird.create!(name: "Bird 5", flock_id: @flock_2_id, band_id: 5, age: 4, is_bonded: true)
    end

    describe "flocks_by_creation_date" do
      it "returns all flocks ordered by created_at desc" do
        expect(Flock.flocks_by_creation_date).to eq([@flock_3, @flock, @flock_2])
      end
    end

    describe "get_bird_count" do
      it "returns the number of birds associated with the flock" do
        expect(@flock.get_bird_count).to eq(3)
      end
    end

    describe "sort_birds_alpha" do
      it "returns all birds in a flock, sorted alphabetically" do
        expect(@flock.sort_birds_alpha).to eq([@bird2, @bird3, @bird1])
      end
    end

    describe "birds_by_age" do
      it "returns all birds in a flock, filtered by a given threshold on age" do
        expect(@flock.birds_by_age(5)).to eq([@bird1, @bird2])
      end
    end

    describe "order_by_count" do
      it "returns all flocks, ordered by count of birds associated with each flock" do
        expect(Flock.order_by_count).to eq([@flock, @flock_2, @flock_3])
      end
    end
  end
end