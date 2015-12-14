#!/usr/bin/env bash

eval $(docker-machine env dinghy)

PATH=/opt/boxen/rbenv/shims:$PATH

bundle check || bundle install --path vendor/bundle --binstubs bin -j4
