class Flock < ApplicationRecord
  has_many :birds

  def get_bird_count
    self.birds.count
  end
end