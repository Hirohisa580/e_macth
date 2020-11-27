# イーマッチER図

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|first_name_ruby|string|null: false|
|last_name|string|null: false|
|last_name_ruby|string|null: false|
|birthday|date| ※date_select使用|

### Association
- has_one :profile
- has_one :dm
- has_many :messages
- has_many :boards
- has_many :comments



--- 
## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false|
|age|integer|null: false|
|area_id|integer|null: false ※ActiveHash使用|
|genre_id|integer|null: false ※ActiveHash使用|
|history|string|    |
|self_pr|text|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user



---
## dmsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :messages



---
## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|test|null: false|
|user|references|null: false, foreign_key: true|
|dm|references|null: false, foreign_key: true|

### Association
* belongs_to :user
* belongs_to :dm



---
## boardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|genre_id|integer|null: false ※ActiveHash使用|
|explanation|text|  |
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments



---
## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|test|null: false|
|user|references|null: false, foreign_key: true|
|board|references|null: false, foreign_key: true|

### Association
* belongs_to :user
* belongs_to :board
