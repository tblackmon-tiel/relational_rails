class CreateFlock < ActiveRecord::Migration[7.0]
  def change
    create_table :flocks do |t|
      t.string :name
      t.integer :cage_number
      t.boolean :accepts_new_birds

      t.timestamps
    end
  end
end
