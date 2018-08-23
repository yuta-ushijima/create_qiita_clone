# README

## Ruby version
2.5.0

## Node version
6.0.0
## Npm version
3.0.0

## Infrastructure
```
$ brew install mysql
```

## copy yml files
```
$ cp config/devise.yml.sample config/devise.yml
$ cp config/sentry.yml.sample config/sentry.yml
```

## Install gems
```bash
$ bundle install --path vendor/bundle --jobs=4
```

## Database creation & initialization
```bash
$ bundle exec rails db:create db:migrate
```

## How to run the test suite
```bash
$ bundle exec rspec
```

## How to run application servers
```bash
$ bundle exec rails server
```

## How to run client servers
```bash
$ cd frontend
$ yarn start
```
