class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :encrypted_password
      t.string :salt
      t.boolean :admin

      t.timestamps
    end
  end
end
