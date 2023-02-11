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

# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | -----------         |
| email              | string | null: false, unique |
| encrypted_password | string | null: false         |
| nickname           | string | null: false         |
| last_name          | string | null: false         |
| first_name         | string | null: false         |
| last_name_kana     | string | null: false         |
| first_name_kana    | string | null: false         |
| birth_date         | date   | null: false         |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| price         | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     | null: false                    |
| postal_code   | integer    | null: false                    |
| phone_number  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order