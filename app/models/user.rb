class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birthday_year
  belongs_to_active_hash :birthday_month
  belongs_to_active_hash :birthday_day
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
         
  
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

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

    if user.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    return { user: user ,sns: sns}
  end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
end