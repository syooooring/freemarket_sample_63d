class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,                     null: false
      t.text    :image,                    null: false
      t.integer :size
      t.integer :state,                    null: false
      t.integer :delivery_fee,             null: false
      t.integer :shipping_method,          null: false
      t.integer :estimated_shipping_date,  null: false
      t.integer :price,                    null: false
      t.text    :text,                     null: false
      t.integer :inappropriate_item
      t.integer :prefecture_id
      t.integer :state_id
      t.integer :delivery_id  
      t.integer :estimated_shipping_data_id
      t.timestamps
    end
  end
end
