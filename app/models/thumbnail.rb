class Thumbnail < ApplicationRecord
  belongs_to :item
  mount_uploader :images, ImageUploader
  validates :images,  presence: :true
end