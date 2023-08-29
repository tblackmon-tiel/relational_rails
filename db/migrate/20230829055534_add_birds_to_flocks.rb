class AddBirdsToFlocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :birds, :flock, references: :flocks, null: false, foreign_key: true
  end
end
