class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :ticker
      t.string :name
      t.date :date
      t.integer :amount
      t.boolean :active
      t.text :description

      t.timestamps
    end
  end
end
