# http://stackoverflow.com/questions/3610987/how-to-fetch-multiple-feeds-concurrently

#!/usr/bin/env ruby
require 'rubygems'
require 'typhoeus'
require 'feedzirra'

feed_urls = ["http://feeds.feedburner.com/PaulDixExplainsNothing", "http://feeds.feedburner.com/trottercashion"]

hydra = Typhoeus::Hydra.new
feeds = {}

feed_urls.each do |feed|
        r = Typhoeus::Request.new(feed)
        r.on_complete do |response|
                feeds[r.url] = Feedzirra::Feed.parse(response.body)
        end
        hydra.queue r
end
hydra.run
puts feeds.inspect