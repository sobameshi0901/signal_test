# README

Database creation
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password_digest|string|null: false|
|remember_token|string||


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|address|string|null: false|
|phone|integer(limit:1)|null: false|
|email|string||
|image|string||

