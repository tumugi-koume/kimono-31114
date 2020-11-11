# テーブル設計

## users テーブル

| Colum    | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |


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

## obis テーブル

## items テーブル