# テーブル設計

## users テーブル

| Colum    | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

 - has_many :kimonos
 - has_many :obis
 - has_many :items


## kimonos テーブル

| Colum           | Type       | Options           |
| --------------- | ---------- | ----------------- |
| kimono_name_id  | integer    | null: false       |
| kimono_genre_id | integer    |                   |
| tpo_id          | integer    |                   |
| color_pattern   | text       |                   |
| season          | string     |                   |
| material_id     | integer    |                   |
| wore_date       | date       |                   |
| cleaned_date    | date       |                   |
| memo            | text       |                   |
| user            | references | foreign_key: true |

### Association

 - belongs_to :user


## obis テーブル

| Colum           | Type       | Options           |
| --------------- | ---------- | ----------------- |
| obi_name_id     | integer    | null: false       |
| tpo_id          | integer    |                   |
| color_pattern   | text       |                   |
| season          | string     |                   |
| material_id     | integer    |                   |
| wore_date       | date       |                   |
| cleaned_date    | date       |                   |
| memo            | text       |                   |
| user            | references | foreign_key: true |

### Association

 - belongs_to :user


## items テーブル

| Colum           | Type       | Options           |
| --------------- | ---------- | ----------------- |
| item_name_id    | integer    | null: false       |
| tpo_id          | integer    |                   |
| color_pattern   | text       |                   |
| season          | string     |                   |
| material_id     | integer    |                   |
| wore_date       | date       |                   |
| cleaned_date    | date       |                   |
| memo            | text       |                   |
| user            | references | foreign_key: true |

### Association

 - belongs_to :user