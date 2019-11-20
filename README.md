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

