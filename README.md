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
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_date       | date    | null: false |

### Association

- has_many :items 
- has_many :purchases


## items テーブル

| Column                     | Type     | Options                       |
| -------------------------- | -------- | ----------------------------- |
| image                      | string   | null: false                   |
| name                       | string   | null: false                   |
| info                       | text     | null: false                   |
| category_id                | integer  | null: false                   |
| sales_status_id            | integer  | null: false                   |
| shipping_fee_status_id     | integer  | null: false                   |
| prefecture_id              | integer  | null: false                   |
| schedule_delivery_id       | integer  | null: false                   |
| price                      | integer  | null: false                   |
| user_id                    | integer  | null: false ,foreign_key: true|


### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column        | Type    | Options                       |
| ------------- | ------- | ----------------------------- |
| user_id       | integer | null: false ,foreign_key: true|
| item_id       | integer | null: false ,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :orders


## order テーブル

| Column            | Type    | Options                       |
| ----------------- | ------- | ------------------------------|
| postal_code       | string  | null: false                   |
| prefecture        | integer | null: false                   |
| city              | string  | null: false                   |
| address           | string  | null: false                   |
| building_name     | string  |                               |
| phone_number      | integer | null: false                   |
| purchase_id       | integer | null: false ,foreign_key: true|

### Association

- belongs_to :purchase
