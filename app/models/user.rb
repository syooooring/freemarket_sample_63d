class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birthday_year
  belongs_to_active_hash :birthday_month
  belongs_to_active_hash :birthday_day
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :sns_credentials, dependent: :destroy
  has_one :card
  

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> {where("buyer_id is NULL")}, foreign_key: "saler_id", class_name: "Item" 
  has_many :selling_items, -> {where("buyer_id is not NULL")}, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> {where("saler_id is NULL")}, foreign_key: "buyer_id", class_name: "Item"
         
  has_one :address
  has_one :pay
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :pay

  has_many :rates
  has_many :goods
  has_many :items
  has_many :comments
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> {where("buyer_id is NULL")}, foreign_key: "saler_id", class_name: "Item"
  has_many :selling_items, -> {where("buyer_id is not NULL")}, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> {where("saler_id is NULL")}, foreign_key: "buyer_id", class_name: "Item"

  validates :birthday_year_id,  presence: :true
  validates :birthday_month_id, presence: :true
  validates :birthday_day_id,   presence: :true
  validates :phone_number,      presence: :true
  validates :nickname,          presence: :true,     length: {maximum: 20 }
  validates :family_name,       presence: :true,     length: {maximum: 35 }
  validates :last_name,         presence: :true,     length: {maximum: 35 }
  validates :j_family_name,     presence: :true,     length: {maximum: 35 }
  validates :j_last_name,       presence: :true,     length: {maximum: 35 }
  validates :family_name, format: {
  with: /\A[一-龥ぁ-ん]/,
  }
  validates :last_name,format: {
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

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first #firstをつけないとデータが配列で返されて使いたいメソッドが使えなくて困る

    #sns_credentialsが登録されている
    if snscredential.present?
      user = User.where(email: auth.info.email).first

      # userが登録されていない
      unless user.present?
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
      end
      sns = snscredential
      #返り値をハッシュにして扱いやすくする  
      #活用例 info = User.find_oauth(auth) 
             #session[:nickname] = info[:user][:nickname]
      { user: user, sns: sns}

    #sns_credentialsが登録されていない
    else
      user = User.where(email: auth.info.email).first


      # userが登録されている
      if user.present?
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )

        { user: user, sns: sns}

      # userが登録されていない
      else
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: uid,
          provider: provider
        )

        { user: user, sns: sns}
      end
    end
  end
end