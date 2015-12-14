#!/bin/bash

PATH=/opt/boxen/rbenv/shims:$PATH

bundle check || bundle install --path vendor/bundle --binstubs bin -j4
