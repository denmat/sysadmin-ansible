#!/usr/bin/env bash

PATH=/opt/boxen/rbenv/shims/bundle:/opt/boxen/homebrew/bin:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin

rbenv shell 2.2.3

eval $(docker-machine env dinghy)

bundle check || bundle install --path vendor/bundle --binstubs bin -j4

bundle exec rake docker:build
bundle exec rake docker:run
bundle exec rake spec
bundle exec rake docker:clean
