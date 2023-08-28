class Flock < ApplicationRecord
  has_many :birds

  validates_presence_of :name
  validates_presence_of :cage_number
  validates :accepts_new_birds, inclusion: [true, false]

  def get_bird_count
    self.birds.count
  end
end