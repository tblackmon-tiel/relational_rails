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
end