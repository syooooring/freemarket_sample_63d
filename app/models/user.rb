class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birthday_year
  belongs_to_active_hash :birthday_month
  belongs_to_active_hash :birthday_day
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_one :pay
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :pay

  has_many :rates
  has_many :goods
  has_many :items
  has_many :comments

  validates :birthday_year_id,  presence: :true
  validates :birthday_month_id, presence: :true
  validates :birthday_day_id,   presence: :true
  validates :phone_number,      presence: :true,     length: {maximum: 11 }
  validates :nickname,          presence: :true,     length: {maximum: 20 }
  validates :family_name,       presence: :true,     length: {maximum: 35 }
  validates :last_name,         presence: :true,     length: {maximum: 35 }
  validates :j_family_name,     presence: :true,     length: {maximum: 35 }
  validates :j_last_name,       presence: :true,     length: {maximum: 35 }
  validates :family_name, format: {
  with: /\A[一-龥ぁ-ん]/,
  }
  validates :family_name,format: {
  with: /\A[一-龥ぁ-ん]/,
  }
  validates :j_family_name,format: {
  with: /\A[ァ-ヶー－]+\z/,
  }
  validates :j_last_name,format: {
  with: /\A[ァ-ヶー－]+\z/,
  }
  validates :phone_number,format: {
   with: /\A\d{10}\z|\A\d{11}\z/,
  }
end
