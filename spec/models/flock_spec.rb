require 'rails_helper'

RSpec.describe Flock, type: :model do
  it "exists" do
    flock = Flock.create!(
      name: "Chicken's Flock",
      cage_number: 1,
      accepts_new_birds: true
    )

    expect(flock).to be_a Flock
  end
end