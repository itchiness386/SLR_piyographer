# SLR_piyographer

## サイト概要
「一眼レフを買ったはいいけど使い方がわからない」
「もっと本格的な写真を撮れるようになりたい」など、
そのような悩みを抱えた一眼レフ初心者の撮影技術向上を目的とした画像投稿サイトです。

## 機能
- いいね機能
- コメント機能
- フォロー機能
- ユーザ、カメラ、タグ検索機能
- アクセス数/いいね数ランキング機能

## 必要条件
- ruby 2.5.7
- Rails 5.2.4.1
- bootstrap 4.1.1

## 使い方
1. 撮影した写真を投稿する
2. 他のユーザが投稿した写真を閲覧して、撮影環境を学ぶ
3. お気に入りの投稿には、いいねやコメントをする
4. お気に入りのユーザをフォローする

## インストール
```
$ git clone https://github.com/itchiness386/SLR_piyographer.git
$ cd SLR_piyographer
$ bundle install
$ rails db:migrate
$ rails db:seed
```
