Dir[File.join(__dir__, 'feeds', '*.rb')].each { |f| require(f) }

require 'blue_factory'
require 'sinatra/activerecord'

ActiveRecord::Base.connection.execute "PRAGMA journal_mode = WAL"

# find your did by visiting
# https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle=<handle>
BlueFactory.set :publisher_did, 'did:plc:by27rmmzs5sgto5pg3kqarbj'
BlueFactory.set :hostname, 'feeds.caitlin.cloud'

# uncomment to enable authentication (note: does not verify signatures)
# see Feed#get_posts(params, visitor_did) in app/feeds/feed.rb
# BlueFactory.set :enable_unsafe_auth, true

BlueFactory.add_feed 'survivor', SurvivorFeed.new
