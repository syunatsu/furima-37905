# テーブル設計

## usersテーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encypted_password     | string | null: false               |
| name                  | string | null: false               |

###Association
- has_many :items dependent: :destroy
- has_many :purchases dependent: :destroy

## itemsテーブル

| Column       | Type    | Options                       |
| -------------| ------- | ----------------------------- |
| name         | string  | null: false                   |
| price        | integer | null: false                   |
| description  | text    | null: false                   |
| image        | string  |                               |
| user_id      | integer | null:false, foreign_key: true |
| condition_id | integer | null:false, foreign_key: true |

###Association
- belongs_to :user
- belongs_to :condition
- has_one :purchase

## purchaseテーブル
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true | 
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to: item
- has_one :destination

## destinationテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_code   | string  | null: false                    |
| prefecture    | string  | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |   
| purchase_id       | integer | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## conditionテーブル(Active_hash)

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| item_condition | integer | null: false |

### Association
- has_many :items


