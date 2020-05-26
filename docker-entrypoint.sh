#!/bin/sh

if [ "$1" = "test" ]; then
  export ENV=test
  set -e
  exec bundle exec rake
elif [ "$1" = "run" ]; then
  set -e
  exec ruby app.rb
fi

exec "$@"
