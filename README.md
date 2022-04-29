# テーブル設計

## usersテーブル

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| nickname              | string   | null: false               |
| email                 | string   | null: false, unique: true |
| encypted_password     | string   | null: false               |
| last_name             | string   | null: false               |
| first_name            | string   | null: false               |
| last_name_kana        | string   | null: false               |
| first_name_kana       | string   | null: false               |
| birthday              | date     | null: false               |


### Association
- has_many :items dependent: :destroy
- has_many :purchases dependent: :destroy

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| description     | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| condition_id    | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipment_day_id | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true | 
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to: item
- has_one :destination

## destinationsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |   
| order         | references | null: false, foreign_key: true |
| prefecture_id | integer    | null: false                    |

### Association
- belongs_to :order


