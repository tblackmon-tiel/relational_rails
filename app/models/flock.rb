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

  def birds_by_age(age)
    self.birds.where("age >= ?", age)
  end

  def self.order_by_count
    Flock.find_by_sql("select flocks.*, COUNT(birds.flock_id) as bird_count from flocks
    left join birds on flocks.id = birds.flock_id
    group by flocks.id order by bird_count desc")
  end
end