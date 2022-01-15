# Table 

## Usersテーブル

| Column              | Type   | Options                     |
| ------------------- | ------ | --------------------------- |
| nickname            | string | null: false                 |
| e-mail              | string | null: false, unique: true   |
| password            | string | null: false                 |
| last_name           | string | null: false                 |
| first_name          | string | null: false                 |
| last_name_katakana  | string | null: false                 |
| first_name_katakana | string | null: false                 |
| birthday            | date   | null: false                 |

### Association

- has_many :items
- has_many :bought_item_records
- has_many :deliveries

## Itemsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| price                  | integer    | null: false                    |
| category               | string     | null: false                    |
| condition              | string     | null: false                    |
| delivery_charge_burden | string     | null: false                    |
| shipping_area          | string     | null: false                    |
| days_to_ship           | string     | null: false                    |
| user_id                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :bought_item_record

## Bought_item_record

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : delivery

## Deliveries

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures    | string     | null: false                    |
| city           | string     | null: false                    |
| address        | text       | null: false                    |
| building_name  | string     |                                |
| tel            | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| bought_item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :bought_item_record