# docker-web-dev-template


## stack

- app ( supervisord rails/webpack/sidekick )
- myql
- Redis
- nginx
- Elasticsearch
- Docker
- Github Actions ( CI / CD tool )


## Requirements

- Docker

You need a runtime that installed docker machine for building.


## Development

docs/docker.md 参照


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
- add pry
- localize ( Japanese )
- change config/application.rb
- add & configure rubocop
- splitable route files


## Troubleshooting


