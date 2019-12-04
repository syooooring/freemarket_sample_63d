class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :size
      t.integer :state
      t.integer :delivery_fee
      t.integer :shipping_method
      t.integer :estimated_shipping_date
      t.integer :price
      t.text    :text
      t.integer :inappropriate_item
      t.integer :prefecture_id
      t.references :sailer_id
      t.references :buyer_id
      t.timestamps
    end
  end
end