#! /usr/bin/ruby

$LOAD_PATH << File.expand_path('lib', File.dirname(__FILE__))

require 'config/initializer'

require 'twitter'
require 'faraday'
require 'oj'

require 'message'

client =
  Twitter::REST::Client.new do |config|
    config.consumer_key = Environment.twitter_consumer_key
    config.consumer_secret = Environment.twitter_consumer_secret

    config.access_token = Environment.twitter_access_token
    config.access_token_secret = Environment.twitter_access_token_secret
  end

api_response = Faraday.get('https://api.countryoftheday.com/countries/random')

raise StandardError if api_response.status != 200

data = Oj.load(api_response.body, symbol_keys: true)

message = Message.new(data).to_s

client.update(message)
