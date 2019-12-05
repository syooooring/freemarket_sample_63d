class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :category
  validates :name, :price, :image, :text, :prefecture_id, :delivery_id, :delivery_id, :state_id, presence: true#あとで各項目追加する
  validates :prefecture_id,:delivery_id,:delivery_id,:state_id,numericality:{greater_than_or_equal_to:1}
  mount_uploader :image, ImageUploader
end
