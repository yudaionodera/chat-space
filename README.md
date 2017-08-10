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

## membersテーブル
|Column|Type|Options|
|-----|-----|-----|
|user_id|integer|null: false, foreign_key: true|
|gruop_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## Groupテーブル
|Column|Type|Options|
|-----|-----|-----|
|name|String|null: false, unique: true|
|member_id|integer|null: false, foreign_key: true|

### Association
- has_many :users, through: members
- has_many :messages
- has_many :members


## userテーブル
|Column|Type|Options|
|-----|-----|-----|
|name|text|null: false, unique: true|
|e-mail|text|null: false,unique: true|
|grouo_id|integer|foreign_key: true|

### Association
- has_many :gruops, through: groups
- has many :messages
- has_many :members

## message
|Column|Type|Options|
|-----|-----|-----|
|body|text||
|image|string||
|group_id|integer|foreign_key: true, null: false|
|user_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :group
- belongs_to :user

