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

  end
end