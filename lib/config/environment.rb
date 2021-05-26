class Environment
  class << self
    def env
      ENV['ENV'] || 'development'
    end

    def twitter_consumer_key
      ENV['TWITTER_CONSUMER_KEY']
    end

    def twitter_consumer_secret
      ENV['TWITTER_CONSUMER_SECRET']
    end

    def twitter_access_token
      ENV['TWITTER_ACCESS_TOKEN']
    end

    def twitter_access_token_secret
      ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    def api_endpoint
      ENV['API_ENDPOINT'] || 'https://api.countryoftheday.com/countries/random'
    end
  end
end
