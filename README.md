# README

## サービス
- メッセンジャーアプリ（どんな？）

## 目的
- メッセンジャーアプリ制作を通して、チーム開発を学ぶ。

## 目標
- gitを用いたチーム開発ができるようになる。

## 開発フロー
- github-flow
- 新しく何かをするときはmasterから直接ブランチを作る
- 作成したブランチはローカルマシンにコミットして、リモートリポジトリにも同じ名前のブランチとして定期的にPushする
- 開発が完了したらmasterへPull Pequestを送る
- Pull Requestがレビューされたらmasterにマージし、その場で本番環境にリリースする
- 使わないブランチは削除してください

## Features

  
## Project initiation
- リポジトリのクローン
```
git clone git@github.com:masatakashida/crayon.git
```

- Gemのインストール
```
bundle install --path vendor/bundle
```

Things you may want to cover:

* Ruby version
- ruby 2.4.0

* Rails version
- rails 5.1.3

* System dependencies

* Configuration

* Database creation（まだDB作っていない。）
```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
```


* Database initialization

* How to run the test suite

* CI as a service

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
