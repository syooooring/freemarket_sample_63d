class CreateEstimateds < ActiveRecord::Migration[5.2]
  def change
    create_table :estimateds do |t|
      t.integer :estimated_shipping_date_id

      t.timestamps
    end
  end
end
