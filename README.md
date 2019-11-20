
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
