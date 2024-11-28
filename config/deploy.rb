# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "bsky_feeds"
set :repo_url, "git@github.com:caitlin/bsky-feeds.git"
set :branch, 'main'

append :linked_files, "db/bluesky.sqlite3", "db/bluesky.sqlite3-shm", "db/bluesky.sqlite3-wal"

append :linked_dirs, "log", "tmp"

set :default_env, { 'RACK_ENV' => 'production' }
