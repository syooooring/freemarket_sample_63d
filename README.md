# README

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

