# DB 設計

## user table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| confirmation password           | string              | null: false             |


### Association

* has_many :goods
* belongs_to :address

## goods table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| goods name                          | string     | null: false       |
| goods text                          | text       | null: false       |
| category                            | string     | null: false       |
| goods state                         | integer    | null: false       |
| delivery fee                        | integer    | null: false       |
| ship area                           | integer    | null: false       |
| days                                | integer    | null: false       |


### Association

- belongs_to :user
- has_one :address

## address table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal code | string     | null: false       |
| prefecture  | string     | null: false       |
| city        | string     | null: false       |
| house number| string     | null: false       |
| phone number| string     | null: false       |

### Association

- belongs_to :goods
- belongs_to :user
- has_one :purchase history

## purchase history table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| buyer       |  string    | foreign_key: true |
| user        | references | foreign_key: true |
| goods       | references | foreign_key: true |

### Association

- belongs_to :address