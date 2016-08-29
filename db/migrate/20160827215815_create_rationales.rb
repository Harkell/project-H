class CreateRationales < ActiveRecord::Migration
  def change
    create_table :rationales do |t|
      t.integer :position_id
      t.text :reasons
      t.text :merits
      t.text :concerns

      t.timestamps
    end
  end
end
