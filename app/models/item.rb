class Item < ApplicationRecord
  # belongs_to :category
  # belongs_to :user
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :thumbnails
  accepts_nested_attributes_for :thumbnails

end