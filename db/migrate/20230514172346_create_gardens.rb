class CreateGardens < ActiveRecord::Migration[7.0]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :location
      t.boolean :plantable
      t.integer :plot

      t.timestamps
    end
  end
end
