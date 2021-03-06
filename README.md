# ror-app-dev-template

![Build Status](https://github.com/t-kawatsu/ror-app-dev-template/actions/workflows/test.yml/badge.svg)

This is the template repository for Ruby on Rails web-api applications that are constructed with Docker.


## stack

- app ( supervisord rails/webpack/sidekick )
- myql
- Redis
- nginx
- Elasticsearch
- Docker
- Github Actions ( CI / CD tool )


## Development

### Requirements

- Docker

You need a runtime that installed docker for building.

### set up

```
$ docker-compose build
$ cp .env.development .env.development.local # for override env variables
$ docker-compose run --rm app bin/setup
$ docker-compose up
```


## Logs

```
$ docker-compose run --rm --service-ports app /bin/bash
(docker) $ bundle init
- add "gem 'rails'" in Gemfile
(docker) $ bundle install --path vendor/bundle
(docker) $ bundle exec rails new . -d mysql --api
- set up db connection
(docker) $ bin/setup
(docker) $ bin/rails s -b 0.0.0.0

DONE! ( you can access to 'http://localhost:3000/' )
```

additional changes
- gems
    - pry
    - dotenv
    - rubocop ( configured ) 
    - brakeman
    - rspec
    - factory_bot
    - data_migrate
    - danger
- localize ( Japanese )
- config/application.rb
- splitable route files
- some controllers
- add migration script ( bin/migrate )


## TODO

- Docker for Mac だと filesync が遅い為かrailsへのhttpアクセスが重すぎる
    - ここらへんを使うか https://qiita.com/pocari/items/0340049742927f3a94b7
    - 他の方法で解決


## Troubleshooting


