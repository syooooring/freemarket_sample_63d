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