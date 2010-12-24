# require 'feedzirra'


namespace :parser do
  # This init task disable mongoid logging to Rails logger
  task :test do
    # You can add custom parsing to the feed entry classes. Say you want the wfw:comments fields in an entry
    # Feedzirra::Feed.add_common_feed_entry_element("wfw:commentRss", :as => :comment_rss)
    # The arguments are the same as the SAXMachine arguments for the element method. For more example usage look at the RSSEntry and
    # AtomEntry classes. Now you can access those in an atom feed:
    # Feedzirra::Feed.parse(some_atom_xml).entries.first.comment_rss_ # => wfw:commentRss is now parsed!
    
    
    
    # # feed = Feedzirra::Feed.fetch_and_parse("http://www.canadianbusiness.com/content/FEEDS/RSS/full/markets.xml")
    # feed = Feedzirra::Feed.fetch_and_parse("http://www2.macleans.ca/category/need-to-know/feed/mobile")
    # 
    # 
    # puts feed.title
    # 
    # entries = feed.entries
    # 
    # entries.each do |entry|
    #   puts "description ===> #{entry.summary}"
    #   puts "author ===> #{entry.author}"
    #   puts "link ===> #{entry.url}"
    #   puts "guid ===> #{entry.entry_id}"
    #   puts "published ===> #{entry.published}"
    #   puts "categories ===> #{entry.categories}"
    #   puts "content ===> #{entry.content}"
    #   puts "-----------------------------------------------"
    # end
    
    
    
    # Feedzirra::Feed.add_common_feed_entry_elements("media:content", :value => :url, :as => :media_content) 
    # Feedzirra::Feed.add_common_feed_entry_elements("media:title", :as => :media_title) 
    
    feed = Feedzirra::Feed.fetch_and_parse("http://dev.blog.canadianbusiness.com/category/gallery/feed/?show_custom_feed=photo")
    # feed = Feedzirra::Feed.fetch_and_parse("http://www2.macleans.ca/feed/rotator")
    
    
    puts feed.title
    
    entries = feed.entries
    
    entries.each do |entry|
      puts "description ===> #{entry.summary}"
      puts "author ===> #{entry.author}"
      puts "link ===> #{entry.url}"
      puts "guid ===> #{entry.entry_id}"
      puts "published ===> #{entry.published}"
      puts "categories ===> #{entry.categories}"
      puts "content ===> #{entry.content}"
      puts "media contents ===> #{entry.media_contents}"
      # puts "media titles ===> #{entry.media_title}"
      puts "-----------------------------------------------"
    end
    
    
  end
end
