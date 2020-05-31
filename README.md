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

# VGyoU DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_alphabet|string|null: false|
|first_name_alphabet|string|null: false|
|nickname|string|null: false|
|e-mail|string|null: false, unique: true|
|password|string|null: false|
|birthday|date|null: false|
### Association
has_many :posts
has_many :likes
has_many :comments


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|duration|integer|null: false| 
|discription|text||
|user_id|integer|dependent: :destroy|
### Association
belongs_to :user
has_many :images
has_many :comments
has_many :likes
has_many :tags, through: :posts_tags
has_many :posts_tags
has_many :categories, through: :posts_tags
has_many :categories_posts


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, dependent: :destroy|
### Association
belongs_to :post


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true, independent: :destroy|
### Association
belongs_to :user
belongs_to :post


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|post_id|integer|null: false, independent: :destroy|
### Association
belongs_to :user
belongs_to :post


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
has_many :posts_tags
has_many  :posts,  through:  :posts_tags

## posts_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
belongs_to :post
belongs_to :tag


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
has_many :posts_categories
has_many :posts, through: :photos_tags


## posts_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|categiry_id|integer|null: false, foreign_key: true|
### Association
belongs_to :post
belongs_to :category