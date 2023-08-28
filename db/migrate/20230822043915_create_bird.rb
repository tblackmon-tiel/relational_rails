class CreateBird < ActiveRecord::Migration[7.0]
  def change
    create_table :birds do |t|
      t.integer :flock_id
      t.string :name
      t.integer :band_id
      t.integer :age
      t.boolean :is_bonded

      t.timestamps
    end

    add_foreign_key :birds, :flocks
  end
end
