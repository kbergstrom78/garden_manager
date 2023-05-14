class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :plant_type
      t.string :light
      t.string :water
      t.boolean :poisonous
      t.integer :zone
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
