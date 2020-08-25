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

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| family_name    | string  | null: false |
| sei            | string  | null: false |
| mei            | string  | null: false |
| year_of_birth  | integer | null: false |
| birth_month    | integer | null: false |
| birthday       | integer | null: false |

### Association

- has_many :items
- has_many :addressees


## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| image                | string  | null: false |
| name                 | string  | null: false |
| explanation          | string  | null: false |
| category             | string  | null: false |
| delivery_fee         | string  | null: false |
| ship_prefecture      | string  | null: false |
| days_until_shipping  | integer | null: false |
| price                | integer | null: false |

### Association

- belongs_to :user
- has_one :addressees


## addressees テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| postal_code       | string  | null: false |
| prefecture        | string  | null: false |
| city              | string  | null: false |
| address           | string  | null: false |
| building_name     | string  |             |
| phone_number      | string  | null: false |
| card_number       | integer | null: false |
| expiration_year   | integer | null: false |
| expiration_month  | integer | null: false |
| cvv               | integer | null: false |

### Association

- belongs_to :item
- belongs_to :user
