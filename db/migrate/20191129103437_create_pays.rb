class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.string :card_number,          null: false
      t.integer :deadline_month_id,   null: false
      t.integer :deadline_year_id,    null: false
      t.integer :security_code,       null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
