#!/bin/bash


bundle check || bundle install --path vendor/bundle --binstubs bin -j4
