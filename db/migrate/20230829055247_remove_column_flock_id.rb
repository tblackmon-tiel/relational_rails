class RemoveColumnFlockId < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :birds, :flocks
    remove_column :birds, :flock_id
  end
end
