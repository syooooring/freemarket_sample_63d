class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.integer :card_number, null: false, unique: true
      t.integer :card_deadline, null: false
      t.integer :security_code, null: false
      t.timestamps
    end
  end
end