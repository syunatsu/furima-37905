# テーブル設計

## usersテーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encypted_password     | string | null: false               |
| name                  | string | null: false               |
| name_kana             | string | null: false               |
| birthday              | string | null: false               |


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
| seller_area_id  | integer    | null: false                    |
| shipment_day_id | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchaseテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true | 
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to: item
- has_one :destination

## destinationテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |   
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


