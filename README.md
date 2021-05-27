# アプリケーション名

<h2>Life Work</h2>

[![Image from Gyazo](https://i.gyazo.com/6f273f7ff1db62d97ebac198c91eb76e.png)](https://gyazo.com/6f273f7ff1db62d97ebac198c91eb76e)

# アプリケーション概要

自分のオススメのYouTube動画を共有（投稿）することが出来るアプリケーションです。<br>
新規登録、ログインをすると投稿することができます。実際に投稿したYouTube動画のURLを貼ることで、すぐに動画を見ることができます。<br>
各投稿にコメントすることができるため、アウトプットすることもできます。<br>
ログインしていない場合は、運営者のオススメ動画を、ランキング形式で見ることができます。

# 本番環境

http://52.199.210.74/

●ログイン情報（テスト用）<br>
・Eメール test@com<br>
・パスワード ttt111


# 制作背景（意図）

どんな小さいなことでも構わないから、人生に影響を与えたい。私自身、YouTubeを通して人生を変えるきっかけを頂きました.皆さんにも何かを変えるきっかけになれば良いなと思い、作成致しました。<br>
YouTubeではおおくのコンテンツがあるため、全てを見ることは困難だと思いました。<br>
予め、オススメとされているYouTubeを見て学ぶことができたら、これほど生産性の高いことはないと考えました。


# DEMO

<h2>トップページ</h2><br>
・ログインしていない場合

[![Image from Gyazo](https://i.gyazo.com/93cd267d354a0295d37ff04e6a312463.jpg)](https://gyazo.com/93cd267d354a0295d37ff04e6a312463)

・ログインしている場合

[![Image from Gyazo](https://i.gyazo.com/a32f76a24e0631de8042adb575eeb846.jpg)](https://gyazo.com/a32f76a24e0631de8042adb575eeb846)

<h2>ログイン画面</h2><br>

[![Image from Gyazo](https://i.gyazo.com/15d1d513e52df24b4de849dd41fd4925.png)](https://gyazo.com/15d1d513e52df24b4de849dd41fd4925)

<h2>新規登録画面</h2><br>

[![Image from Gyazo](https://i.gyazo.com/d895c2749222e25955ffbb440e64ec32.png)](https://gyazo.com/d895c2749222e25955ffbb440e64ec32)

<h2>投稿画面</h2><br>

[![Image from Gyazo](https://i.gyazo.com/3a90caccd8381fbe6581cef24b2afdb2.png)](https://gyazo.com/3a90caccd8381fbe6581cef24b2afdb2)

<h2>投稿詳細画面</h2><br>

[![Image from Gyazo](https://i.gyazo.com/5490314d23f7331ac8fe48a5a12abae5.png)](https://gyazo.com/5490314d23f7331ac8fe48a5a12abae5)

# 工夫したポイント

YouTubeのリンク先（URL）に移動することが出来るようにしました。<br>
投稿する際にサムネを投稿出来るように、ダウロードサイトに移動出来るようにしました。


# 使用技術（開発環境）

・Ruby/Ruby on Rails<br>
・MySQL<br>
・Github<br>
・AWS S3<br>
・AWS EC2<br>
・Visual Studio Code


# 課題や今後実装したい機能

・投稿を検索出来るようになっていますが、タイトル名での検索のみでは無く、カテゴリーを追加して
カテゴリー別に表示出来るようにしたいと考えています。（ActiveHash）<br>
・コメント欄とは別にアウトプット専用のページを設けたいと考えています。


# DB設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :tweets
- has_many :comments


## tweets テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | text       | null: false                    |
| url     | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| tweet  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet