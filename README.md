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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| categories_id   | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| costs_id        | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| days_id         | integer    | null: false                    |

### Association

- has_many :images
- belongs_to :user
- belongs_to_active_hash :categories
- belongs_to_active_hash :status
- belongs_to_active_hash :costs
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :days
- has_one :purchases

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| purchase        | references | null: false, foreign_key: true |
| prefectures_id  | integer    | null: false                    |
| postal_code     | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :purchases
- belongs_to_active_hash :prefecture

## categories テーブル (ActiveHash)

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| categories      | string | null: false |

## status テーブル (ActiveHash)

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| status          | string | null: false |

## days テーブル (ActiveHash)

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| days            | string | null: false |

## costs テーブル (ActiveHash)

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| costs           | string | null: false |

## prefectures テーブル (ActiveHash)

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| prefectures     | string | null: false |
