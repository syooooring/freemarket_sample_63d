class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true



  validates :family_name,     presence: :true
  validates :last_name,       presence: :true
  validates :postal_code,     presence: :true
  validates :prefecture_id,   presence: :true
  validates :city,            presence: :true
  validates :banti,           presence: :true
  validates :building_name,   presence: :true
  validates :phone_number,    presence: :true,      length: {maximum: 11}
  validates :phone_number,format: {
  with: /\A\d{10,11}\z/,
  }

end