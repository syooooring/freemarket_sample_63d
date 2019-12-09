class Item < ApplicationRecord
  # belongs_to :category
  belongs_to :saler, optional: true, class_name: "User"
  belongs_to :buyer, optional: true, class_name: "User"
  has_many :thumbnails
  accepts_nested_attributes_for :thumbnails

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery
  belongs_to_active_hash :state
  belongs_to_active_hash :estimated_shipping_date
end