# Table 

## Usersテーブル

| Column              | Type   | Options                     |
| ------------------- | ------ | --------------------------- |
| nickname            | string | null: false                 |
| email               | string | null: false, unique: true   |
| encrypted_password  | string | null: false                 |
| last_name           | string | null: false                 |
| first_name          | string | null: false                 |
| last_name_katakana  | string | null: false                 |
| first_name_katakana | string | null: false                 |
| birthday            | date   | null: false                 |

### Association

- has_many :items
- has_many :bought_item_records

## Itemsテーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| name                      | string     | null: false                    |
| description               | text       | null: false                    |
| price                     | integer    | null: false                    |
| category_id               | integer    | null: false                    |
| condition_id              | integer    | null: false                    |
| delivery_charge_burden_id | integer    | null: false                    |
| shipping_area_id          | integer    | null: false                    |
| days_to_ship_id           | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :bought_item_record

## Bought_item_record

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : delivery

## Deliveries

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| tel                | string     | null: false                    |
| bought_item_record | references | null: false, foreign_key: true |

### Association

- belongs_to :bought_item_record