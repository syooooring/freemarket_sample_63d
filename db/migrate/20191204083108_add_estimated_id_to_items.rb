class AddEstimatedIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :estimated_shipping_data_id, :integer
  end
end
