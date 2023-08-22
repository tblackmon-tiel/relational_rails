require 'rails_helper'

RSpec.describe Bird, type: :model do
  it "exists" do
    bird = Bird.create!(
      name: "Chicken",
      # flock_id: 1,
      band_id: 272,
      age: 6,
      is_bonded: true
    )
    
    expect(bird).to be_a Bird
  end
  describe "instance methods" do

  end
end