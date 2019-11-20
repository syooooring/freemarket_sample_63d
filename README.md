# README

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|text|text|null: false|
|inapporate_comment|integuer||

### Association
- belongs_to :item
- belongs_to :user

## paysテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|card_deadline|integer|null: false|
|Security_code|integer|null: false|
### Association
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|
|introduction|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|email|string|null: false|
|phone_number|integer|null: false|
|image|text|
|point|integer|null: false|

### Association
- belongs_to :address
- belongs_to :pay

- has_many :rates
- has_many :goods
- has_many :items
- has_many :comments

##  itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|size|integer|?|
|state|integer|null: false|
|delivery_fee|integer|null: false|
|shipping_method|integer|null: false|
|estimated_shipping_date|integer|null: false|
|price|integer|null: false|
|text|text|null: false|
|inappropriate_item|integer||

### Association
- belongs to :user
- has_many :comments
- has_many :goods
- belongs to :category