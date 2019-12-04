# README

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|parent_id|integer|null: false|

### Association
- has_many :items
- has_many :brands


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|
|category_id|integer|null: false|

### Association
- belongs_to :category


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|last_name|string|null: false|
|postal-code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|banti|string|null: false| 
|building_name|string|
### Association
belongs_to :users


 ## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|rater_id|references|
|rated_id|references|
|level|integer|
### Association
belongs_to :users

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
|size|integer||
|state|integer|null: false|
|delivery_fee|integer|null: false|
|shipping_method|integer|null: false|
|estimated_shipping_date|integer|null: false|
|price|integer|null: false|
|text|text|null: false|
|inappropriate_item|integer||
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|prefectures|integer|null: false|

### Association
- belongs_to :user
- has_many :comments
- has_many :goods
- belongs_to :category
