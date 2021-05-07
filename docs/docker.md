# Docker での開発環境構築について

## Requirements

### Docker

Mac であれば Docker for Mac
https://docs.docker.com/docker-for-mac/install/

## Installation

### リポジトリ clone

```
$ git clone [this repository]
$ cd [this repository name]
```

### セットアップ

```
$ docker-compose build
( $ docker-compose run app [appに必要なsetupコマンド] )
$ docker-compose up
```


## 運用にあたって

改変しまくっているといつしかdocker imageが多くなっていくので削除していく

```
$ docker image prune
$ docker container prune
...
```

### dockerファイル更新反映
```
$ docker-compose down
$ docker-compose build
$ docker-compose up
```


## TODO

- Docker for Mac だと filesync が遅い為かrailsへのhttpアクセスが重すぎる
    - ここらへんを使うか https://qiita.com/pocari/items/0340049742927f3a94b7
    - 他の方法で解決
- 他開発してみて気になったところを直していく
