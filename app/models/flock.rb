class Flock < ApplicationRecord
  has_many :birds, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :cage_number
  validates :accepts_new_birds, inclusion: [true, false]

  def get_bird_count
    self.birds.count
  end

  def sort_birds_alpha
    self.birds.order(:name)
  end
end