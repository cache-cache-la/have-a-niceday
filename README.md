# データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, default: ""|
|password|string|null: false, default: ""|

### Association
- has_many :entries
- has_many :comments


## entriesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|string|null: false|
|image|string||
|url|text||
|user_id|references|foreign_key: true|

### Association
- has_many :tag_maps
- has_many :tags, through: :tag_maps
- has_many :comments
- belongs_to :user


## tag_mapsテーブル
|Column|Type|Options|
|------|----|-------|
|entry_id|references|foreign_key: true|
|tag_id|references|foreign_key: true|

### Association
- belongs_to :entry
- belongs_to :tag


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :tag_maps
- has_many :entries, through: :tag_maps


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|references|foreign_key: true|
|entry_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :entry
