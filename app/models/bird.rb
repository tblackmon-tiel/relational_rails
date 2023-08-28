class Bird < ApplicationRecord
  belongs_to :flock

  validates_presence_of :name
  validates_presence_of :flock_id
  validates_presence_of :band_id
  validates_presence_of :age
  validates :is_bonded, inclusion: [true, false]

  def self.get_bonded_birds
    Bird.where(is_bonded: true)
  end
end