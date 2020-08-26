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

# users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_date       | date    | null: false |

### Association

- has_many :items 
- has_many :purchases


## items テーブル

| Column                     | Type     | Options     |
| -------------------------- | -------- | ----------- |
| image                      | string   | null: false |
| name                       | string   | null: false |
| explanation                | string   | null: false |
| genre_category             | integer  | null: false |
| genre_delivery_fee         | integer  | null: false |
| genre_ship_prefecture      | integer  | null: false |
| genre_days_until_shipping  | integer  | null: false |
| price                      | integer  | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| user_id       | integer | null: false |
| item_id       | integer | null: false |
| addressee_id  | integer | null: false |

### Association

- belongs_to user
- belongs_to item
- belongs_to addressee


## addressees テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| postal_code       | string  | null: false |
| prefecture        | string  | null: false |
| city              | string  | null: false |
| address           | string  | null: false |
| building_name     | string  |             |
| phone_number      | string  | null: false |

### Association

- belongs_to :item
- belongs_to :user
