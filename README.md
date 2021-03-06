# README

## サービス
- メッセンジャーアプリ

## 目的
- メッセンジャーアプリ制作を通して、**Web開発**と**チーム開発**を学ぶ。

## 目標
- gitを用いたチーム開発ができるようになる。

## 開発フロー
- github-flow >> git-flowへ以降
- 新しく何かをするときはmasterから直接ブランチを作る
- 作成したブランチはローカルマシンにコミットして、リモートリポジトリにも同じ名前のブランチとして定期的にPushする
- 開発が完了したらmasterへPull Pequestを送る
- Pull Requestがレビューされたらmasterにマージし、その場で本番環境にリリースする
- 使わないブランチは削除してください

## Contents

## Features

### アプリケーションサーバー

- unicorn

### デプロイ

- capistrano
  
## Project initiation
- リポジトリのクローン
```
git clone git@github.com:masatakashida/crayon.git
```

## Configuration
- comming soon!

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

* Database creation
```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
```


* Database initialization

* How to run the test suite

* CI as a service

- Jenkins

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

```
bundle exec cap production deploy
```

* ...
