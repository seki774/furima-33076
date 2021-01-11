# DB 設計

## user table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |

### Association

* has_many :goods
* belongs_to :address

## goods table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| goods name                          | string     | null: false       |
| goods text                          | text       | null: false       |
| category                            | string     | null: false       |
| goods state                         | string     | null: false |
| delivery fee                        | string     | null: false       |
| ship area                           | string     | null: false       |
| days                                | string     | null: false       |


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

## purchase history table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| buyer       |  string    | foreign_key: true |

### Association

- belongs_to :