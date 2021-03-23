# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases
- has_one :addresses

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| text               | text    | null: false |
| category           | string  | null: false |
| status             | string  | null: false |
| shipping_charges   | string  | null: false |
| shipping_area      | string  | null: false |
| days_to_ship       | string  | null: false |
| price              | integer | null: false |
### Association

- has_many :comments
- has_one  :purchases
- belongs_to :user

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | integer    | null: false,                   |
| prefectures  | string     | null: false,                   |
| municipality | string     | null: false,                   |
| address      | integer    | null: false,                   |
| building     | string     |                                |
| telephone    | integer    | null: false,                   |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false,                   |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
