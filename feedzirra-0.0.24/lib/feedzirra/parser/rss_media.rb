module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Atom feed entries.
    #
    # == Attributes
    # * title
    # * url
    # * author
    # * content
    # * summary
    # * published
    # * categories
    class RSSMedia
      include SAXMachine
      include FeedEntryUtilities
      element :"media:content", :as => :url, :value => :url
      element :"media:title", :as => :title
      element :"media:description", :as => :description, :with => {:type => "html"}
      element :"media:thumbnail", :as => :thumbnail, :value => :url
    end

  end
  
end