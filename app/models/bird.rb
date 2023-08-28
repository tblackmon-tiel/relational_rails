class Bird < ApplicationRecord
  belongs_to :flock

  validates_presence_of :name
  validates_presence_of :flock_id
  validates_presence_of :band_id
  validates_presence_of :age
  validates :is_bonded, inclusion: [true, false]
end