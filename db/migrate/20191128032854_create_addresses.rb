class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false
      t.string :family_name,        null: false
      t.string :last_name,          null: false
      t.string :postal_code,        null: false
      t.string :banti,              null: false
      t.string :building_name,      null: false
      t.string :phone_number,       null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
