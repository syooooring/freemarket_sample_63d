# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
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