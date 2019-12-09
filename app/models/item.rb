class Item < ApplicationRecord
  validates :name, :price, :text, :prefecture_id, :delivery_id, :delivery_id, :state_id, presence: true#あとで各項目追加する
  validates :prefecture_id,:delivery_id,:delivery_id,:state_id,numericality:{greater_than_or_equal_to:1}

  #belongs_to :category
  #has_many :comments
  #has_many :goods
  belongs_to :saler, optional: true, class_name: "User"
  belongs_to :buyer, optional: true, class_name: "User"
  has_many :thumbnails
  accepts_nested_attributes_for :thumbnails

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery
  belongs_to_active_hash :state
  belongs_to_active_hash :estimated_shipping_date
end
