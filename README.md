# README

Database creation
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true, specific_format|
|password_digest|string|null: false|


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|address|string||
|phone|string|null: false, length: 11|
|email|string|specif_format|
|image|string|null:false|

