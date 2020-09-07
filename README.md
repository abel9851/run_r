# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Run Record 
<br>

# 概要
気晴らしや適度な運動習慣でランニングを楽しむ方から、競技思考の方まで<br>
様々な目的を持つランナーをサポートするサービスです。<br>
PC、スマートフォンどちらでもお使い頂けます。<br>
<br>

# URL
http://54.150.90.255/<br>
<br>

# テスト用アカウント
Email　　 ：a@a<br>
<br>
password ：111111<br>
<br>

# 機能一覧

### ランニングコースの投稿機能
・お気に入りのランニングコース（写真、住所、簡単な説明文）を投稿・編集・削除<br>
<br>
・GoogleMapに投稿時の住所位置をピン留め表示<br>
<br>
・非同期通信でのコメント機能<br>
<br>

### ユーザー管理機能
・ユーザー情報の登録・編集・削除<br>
<br>
・ベストタイム（5km、10km、ハーフ、フル）の登録・編集・削除（<br>
<br>

### 走力・ランニングペース確認機能
・登録したベストタイムから、各距離の得意不得意をグラフ化して表示。<br>
<br>
・登録したベストタイムから、ランニング時の推奨ぺースを目的別に4種類表示。<br>
<br>
・距離別の走力レベル表、走力別の推奨ペース表の一覧を表示<br>
<br>
・専門用語に対する説明文の表示<br>
<br>

### その他
・レスポンシブデザイン<br>
<br>
・ページネーション機能<br>
<br>
・画像投稿時のプレビュー機能<br>
<br>
・ランニングコース投稿一覧の検索機能<br>

# 環境・使用技術
### フロントエンド
・Bootstrap 4.5.0<br>
<br>
・SCSS<br>
<br> 
・JavaScript、jQuery<br>

### バックエンド
・Ruby <br>
<br>
・Ruby on Rails <br>

### 開発環境
・MySQL2<br>

### 本番環境
・AWS (EC2、RDS for MySQL、S3)<br>
<br>
・MySQL2<br>
<br>
・Nginx<br>

# 使用方法
※他のユーザーの投稿や各ユーザーのベストタイムに対応する推奨ペースなど、<br>
 基本的な閲覧はログイン無しで可能。<br>
### お気に入りのランニングコースを投稿
・ログインします。（email：a@a、　password：111111)<br>
<br>
・「お気に入りコースをシェアしよう」をクリック。<br>
<br>
・各フォーム入力して「投稿」ボタンクリック。投稿が完了。<br>
<br>
・投稿一覧の一番上に入力した情報が表示される。<br>
<br>
・ランニングコースの画像をクリック。<br>
<br>
・先ほど入力した住所の位置がGoogleMapにピン留めされた状態で表示される。<br>

### ユーザー管理機能
・トップページの固定ヘッダーの「ユーザー名：さん」をクリック。マイページへ。<br>
<br>
・画面中部にある登録ボタンをクリック。<br>
<br>
・ベストタイムをプルダウンより選択し、「登録」ボタンクリック。ベストタイムが登録される。<br>
<br>
・登録されたタイムはマイページにて表示される。<br>

### 走力・ランニングペース確認機能
・ベストタイムが登録されているユーザーのプロフィール画像（投稿一覧等から）をクリック。<br>
<br>
・クリックしたユーザーのマイページへ遷移するので、画面中部の「練習」ボタンをクリック。<br>
<br>
・画面最上部にグラフが表示されている。（左から5km、10km、ハーフ、フル）<br>
<br>
・グラフの位置が上にある程、その距離の走力レベルが高い。<br>
<br>
・グラフのすぐ下に、距離別の走力レベル表、走力別の推奨ペースを合わせて表示。<br>
<br>
・さらにその下には走力レベル表・推奨ペース表の一覧を全て表示。<br>

# テーブル設計


## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| image                 | string  | null: false |

### Association

- has_many :tweets
- has_many :messages
- has_one :five_km_record
- has_one :ten_km_record
- has_one :half_record
- has_one :full_record  


## tweets テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| content     | string     | null: false                   |
| address     | string     | null: false                   | 
| latitude    | float      |                               |
| longitude   | float      |                               |
| place_name  | string     | null: false                   |
| place_image | string     | null: false                   |
| user        | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_many :messages,  dependent: :destroy


## messages テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       |                                |
| user     | references | null: false, foreign_key: true |
| tweet    | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user


## five_km_records テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| minute_id | integer    | null: false                   |
| second_id | integer    | null: false                   |   
| user      | references | null: false, foreign_key:true |

### Association

- belongs_to_active_hash :minute
- belongs_to_active_hash :second
- belongs_to :user


## ten_km_records テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| minute_id | integer    | null: false                   |
| second_id | integer    | null: false                   |   
| user      | references | null: false, foreign_key:true |

### Association

- belongs_to_active_hash :minute
- belongs_to_active_hash :second
- belongs_to :user


## half_records テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| hour_id   | integer    | null: false                   |
| minute_id | integer    | null: false                   |
| second_id | integer    | null: false                   |   
| user      | references | null: false, foreign_key:true |

### Association

- belongs_to_active_hash :hour
- belongs_to_active_hash :minute
- belongs_to_active_hash :second
- belongs_to :user


## full_records テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| hour_id   | integer    | null: false                   |
| minute_id | integer    | null: false                   |
| second_id | integer    | null: false                   |   
| user      | references | null: false, foreign_key:true |

### Association

- belongs_to_active_hash :hour
- belongs_to_active_hash :minute
- belongs_to_active_hash :second
- belongs_to :user
