require 'rails_helper'

RSpec.describe Bird, type: :model do
  describe "relationships" do
    it { should belong_to :flock }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :flock_id }
    it { should validate_presence_of :band_id }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:is_bonded) }
    it { should allow_value(false).for(:is_bonded) }
  end

  describe "instance methods" do
    before(:each) do
      @flock = Flock.create!(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
      @flock_id = @flock.id
      @bird_1 = Bird.create!(flock_id: @flock_id, name: "Chicken", band_id: 272, age: 6, is_bonded: true)
      @bird_2 = Bird.create!(flock_id: @flock_id, name: "Kiwi", band_id: 23, age: 5, is_bonded: true)
      @bird_3 = Bird.create!(flock_id: @flock_id, name: "Hiccup", band_id: 10, age: 4, is_bonded: false)
    end

    describe "get_bonded_birds" do
      it "returns all bird records where is_bonded is true" do
        expect(Bird.get_bonded_birds).to eq([@bird_1, @bird_2])
      end
    end
  end
end