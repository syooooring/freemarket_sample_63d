class CreateThumbnails < ActiveRecord::Migration[5.2]
  def change
    create_table :thumbnails do |t|
      t.text :images
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
