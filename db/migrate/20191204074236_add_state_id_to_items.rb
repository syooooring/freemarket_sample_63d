class AddStateIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :state_id, :integer
  end
end
