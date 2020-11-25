## アプリケーション名

kimono-31114


## アプリケーション概要

ユーザーが持っている着物を管理する、クローゼットアプリです。


## URL

https://kimono-31114.herokuapp.com/


## テスト用アカウント

Email...    test@test.com
Password... test33


## 利用方法

まず、ユーザー登録を行うことで、サービスを使用できるようになります。
各一覧ページにある、「しまう」ボタンで、着物、帯、小物の登録画面に移動し、情報を入力することで登録を行えます。
登録した情報は、それぞれの一覧ページに表示されます。
表示された登録の画像をクリックすると、その登録の詳細ページに遷移し、詳細情報を閲覧することができます。
詳細ページにある編集ボタンから編集画面に移り、情報の変更を行うことができます。また、詳細画面の削除ボタンを押すと、登録したアイテムが削除されます。
ヘッダーにある虫眼鏡アイコンから、それぞれの検索ページに移動することができます。
検索ページでは、検索したい項目をプルダウンから指定する、テキスト入力することで検索、検索結果アイテムを表示することができます。


## 目指した課題解決

持っている着物を把握しきれない、という課題を解決したいと思い、このアプリケーションを作りました。
ターゲットは、着物を着る20~50代の女性です。
具体的には、着物を着る時や購入するときに自分がどんなアイテムを持っていたかわからない、箪笥からアイテムを一々出して並べて見るのは面倒、という意見の解決を目的にしました。


## 洗い出した要件

| 機能                  | 目的                                           | ストーリー                                                                     | 
| --------------------- | --------------------------------------------- |----------------------------------------------------------------------------  |
| ユーザー管理機能        | ユーザーごとに手持ちのアイテムを管理するため。        | 新規登録、ログイン、ログアウト。                                                   |
| メニュー               | 各ページへの遷移。                               | ヘッダーのメニューボタンにホバーすると、メニューが表示。<br>各一覧ページに遷移。|
| 着物、帯、小物各登録機能  | ユーザーが持っているアイテムの情報を登録する。        | 画像、種類、TPO、着用日、お手入れ日など入力。<br>登録ボタンを押して登録が完了したら、着物一覧画面に遷移。 |
| 各一覧機能             | 登録した着物を一覧にし、手持ちの着物をわかりやすくする。| 各着物の画像と種類を表示。詳細を見たい着物の画像をクリックすると、<br>その着物の詳細画面に遷移。|
| 各詳細機能             | 登録した情報を全て見られるようにする。               | 登録した情報と、編集ボタン、削除ボタンを表示。 |
| 各編集機能             | 登録した内容の変更を可能にする。                    | 編集完了ボタンを押し登録が完了すると、その登録の詳細画面に遷移。 |
| 各削除機能             | 登録した情報の削除をする。                         | 詳細画面に設置された削除ボタンを押すと、その着物の情報を削除。<br>完了後は着物一覧画面に遷移。|
| 各検索機能             | 登録したアイテムを探せる。                         | ヘッダーに検索画面へのリンクを設置。<br>検索したい項目を選択して検索ボタンを押すと、検索結果表示画面に遷移。 |


## 実装した機能についての説明

・各登録機能<br>
'![demo](https://raw.github.com/wiki/tumugi-koume/gif/index.image.gif/)'
https://gyazo.com/e88fe43a82967be5fa6cd956c21474bb
着用できるTPOや、時期、そのアイテムの素材、以前着た日、お手入れした日など、着物を着る女性が実際着用する際に意識していることを、情報として保存できるようにしました。
また、項目の入力にプルダウンを多く実装することで、手間を少なく登録できるようにしました。

・各一覧機能
https://gyazo.com/0e894c8cc0993aa0096b587171f2b620
実際にユーザーが持っているアイテムが一覧で見られるよう実装しました。
画像と種類名のみ表示することで、見やすく、しかし、どんなものを持っていたか全体的に把握できることを意識しました。

・各詳細機能
https://gyazo.com/96d2a4a9c03d60736e8cfb91d0eb48bf
登録した情報を一目で見られます。
編集ボタンを設置することで、簡単に情報の変更を行えるようにしました。

・各検索機能
https://gyazo.com/69affb70dce2412224d8fa4674f1a02f
プルダウンでの検索ができ、より簡単に検索を行うことが可能です。

## 実装予定の機能

ヘッダーに設置する検索ページへのリンクバーは、作成中です。


## データベース設計

### テーブル設計

### users テーブル

| Colum    | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

 - has_many :kimonos
 - has_many :obis
 - has_many :items


### kimonos テーブル

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


### obis テーブル

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


### items テーブル

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


### ER図
<img width="675" alt="kimono-31114_ER図" src="https://user-images.githubusercontent.com/72288311/100189144-0ba0fb80-2f2f-11eb-8e1e-13a127e08bd3.png">

## ローカルでの動作方法

git clone https://github.com/tumugi-koume/kimono-31114.git
cd kimono-31114

MySQLを使用しています。
Rubyのバージョンは、6.0.0 です。
