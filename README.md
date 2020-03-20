Have a Nice Day!
====
<br>

# Overview
趣味や好きな時間を共有する、投稿系アプリケーションとなります。

# Description
以下の機能を実装しています。
* イントロページ
  * cookieを利用し、初回又は30日以上空けて訪問された方に表示
* ユーザー新規登録/ログイン
* ユーザーマイページ
  * ユーザーのnameとemail編集／更新
  * 自身の投稿一覧を表示（1ページ最大3件）
* 投稿
  * 新規、編集ともに投稿画像プレビューあり
  * URL自動リンク
  * タグ機能
* 投稿一覧（1ページ最大9件）
  * トップページは最新投稿
  * 投稿詳細ページの投稿者名やコメント者名をクリックすると、そのユーザーの投稿一覧を表示
* コメント
  * 投稿詳細ページ下部にてコメント可能
  *　非ログインだとフォームは表示されない
* 検索
  * サイドバーのタグ一覧以下のタグ名をクリックすると、タグごとに投稿表示
  * キーワード検索はインクリメンタルサーチを実装
  * どちらの検索でも検索結果の件数表示
* ページ共通
  * サイドバー、フッター固定

# Demo
## 投稿編集
[![Image from Gyazo](https://i.gyazo.com/ddb0aba89d1e9794f05a341a5284794d.gif)](https://gyazo.com/ddb0aba89d1e9794f05a341a5284794d)

## キーワード検索
[![Image from Gyazo](https://i.gyazo.com/55c7ac46ba7eb9311eb84cf7f6df1315.gif)](https://gyazo.com/55c7ac46ba7eb9311eb84cf7f6df1315)

# Usage
* イントロを確認又はスキップ後、テストアカウントでログイン
  * トップページを始めとした各ページからサイドバーの新規投稿（白いメモのイラスト）押下→投稿内容入力（タイトル、本文のみ必須）→投稿完了

# Issue
## URL 

## Test account
* 投稿者用
メールアドレス： 
パスワード：

* 非投稿者用
メールアドレス： 
パスワード： 

<br>

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
