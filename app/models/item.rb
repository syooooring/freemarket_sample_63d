class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :goods
  belongs_to :category
  
end
