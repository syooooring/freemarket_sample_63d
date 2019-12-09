class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :price, :image, :text, :prefecture_id, :delivery_id, :delivery_id, :state_id, presence: true#あとで各項目追加する
  validates :prefecture_id,:delivery_id,:delivery_id,:state_id,numericality:{greater_than_or_equal_to:1}
  mount_uploader :image, ImageUploader
  # belongs_to :user
  has_many :comments
  has_many :goods
  belongs_to_active_hash :delivery
  belongs_to_active_hash :state
  belongs_to_active_hash :estimated_shipping_data
  # belongs_to :category
end
