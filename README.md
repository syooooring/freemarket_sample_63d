# README

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
