# ポートフォリオ（フリマアプリのクローンサイト）
## 概要
* 出品された商品を購入できるサイト。
* 出品時に画像を投稿することもできる。
 <img width="500" alt="wugUQRE3J6kZgj51564408861" src="https://user-images.githubusercontent.com/47979613/63277310-0f7fb000-c2e0-11e9-8462-da3c4096f8d3.png">

## アプリで使用している機能
* 商品出品機能（Carrierwave)
* 決済機能（Payjp)
* ユーザ新規登録、ログイン、ログアウト機能（devise)
* スライドショー機能（Slick)

## 使用技術
- 開発言語/フレームワーク
  - Ruby（2.3.1）/Ruby on Rails（5.0.7.2）
  - Sass
  - JavaScript
- デプロイ
  - Capistrano
- 本番環境
  - AWS
- 画像ストレージ
  - AWS S3
- DB
  - MySQL

# DB設計
***
***
## users Table
| Column | Type| Option |
| :--- | :---: | :---: |
| id | integer | null:false, char(11) |
| email | string | null:false,VARCHAR(255) |
| encrypted_password | string | null:false,VARCHAR(255) |
| kanji_name | string | null:false,VARCHAR(70) |
| kana_name | string | null:false,VARCHAR(70) |
| nickname | string | null:false,VARCHAR(20) |
| birth_of_date | string | null:false,VARCHAR(255) |
| prefecture | string | VARCHAR(255) |
| address | string | VARCHAR(255) |
| profile | string | VARCHAR(255) |
| credit_number | integer | char(11) |
| credit_security_number | integer | char(11) |
| credit_expire_date | integer | char(11) |
| phone_number | string | VARCHAR(255) |

### Association
- has_many :reputations
- has_many :comments
- has_many :products
- has_many :sold_products
- has_many :cards

***
***

## products Table
| Column | Type| Option |
| :--- | :---: | :---: |
| id | integer | null:false, char(11) |
| name | string | VARCHAR(40), index:true |
| price | string | VARCHAR(9999999) |
| size | string | VARCHAR(255) |
| description | string | VARCHAR(1000) |
| favorite | integer | char(11) |
| prodution_quality | string | VARCHAR(255) |
| shipping_price | enum(buyer,exhibitor) | |
| shipping_way | enum(undicided,kuroneko,yupack,yumail) | |
| shipping_place | string | |
| shipping_date | enum(1-2days,2-3days,4-7days) | |
| product_status | string | |
| user_id | integer | null:false, foreign_key: true|
| bland_id | integer | null:true, foreign_key: true|
| category_id | integer | null:false, foreign_key: true |
| sub_category_id | integer | null:false, foreign_key: true |
| item_id | integer | null:false, foreign_key: true|

### Association
- belongs_to :user, optional: true
- has_one :bland
- has_one :region
- has_many :categorys
- has_many :images
- has_one :product_image
- has_many :comments
- accepts_nested_attributes_for :product_image

***
***

## product_images Table
| Column | Type| Option |
| :--- | :---: | :---: |
| id | integer | null:false, char(11) |
| product_id | string | foreign_key: true |
| image | string | VARCHAR(255) |

### Association
- belongs_to :product, optional: true
- belongs_to :user, optional: true
- mount_uploader :image, ImageUploader

***
***

## blands Table
| Column | Type| Option |
| :--- | :---: | :---: |
| id | integer | null:false, char(11) |
| parent_id | integer | char(11) |
| name | string | null:false, VARCHAR(255), index:true |

### Association
- belongs_to :product

***
***

## categorys Table
| Column | Type| Option |
| :--- | :---: | :---: |
| id | integer | null:false |
| name | string | null:false ,index:true|

### Association
- belongs_to :product

***
***

## sub_category Table
| Column | Type| Option |
| :--- | :---: | :---: |
| id | integer | null:false |
| name | string | null:false |
| category_id | integer | null:false, foreign_key: true |

***
***

## item Table
| Column | Type| Option |
| :--- | :---: | :---: |
| id | integer | null:false |
| name | string | null:false |
| sub_category_id | integer | null:false, foreign_key: true |

***
***
