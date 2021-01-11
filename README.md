# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false unique: true|
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_hurigana| string              | null: false             |
| last_name_hurigana | string              | null: false              |
| birthday           | date                | null: false             |



### Association

* has_many :goods
* has_many :purchase_histories

## goods table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| goods_name                          | string     | null: false       |
| goods_price                         | integer     | null: false       |
| goods_text                          | text       | null: false       |
| category_id                         | integer    | null: false       |
| good_state_id                       | integer    | null: false       |
| delivery_fee_id                     | integer    | null: false       |
| ship_area_id                        | integer    | null: false       |
| day_id                              | integer    | null: false       |
| user                                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_history

## addresses table

| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| postal_code          | string     | null: false       |
| ship_area_id         | integer    | null: false       |
| bill                 | string     | null: false       |
| city                 | string     | null: false       |
| house_number         | string     | null: false       |
| phone_number         | string     | null: false       |
| purchase_history     | references | foreign_key: true |


### Association

- belongs_to :purchase_history

## purchase_histories table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| good        | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :goods
- belongs_to :addresses