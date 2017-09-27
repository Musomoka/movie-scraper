class FeedEntry < ActiveRecord::Base
 has_many :reviews
 has_many :libraries
  require 'open-uri'
    
    
    def self.update_from_feed(url)
      feed = Feedjira::Feed.fetch_and_parse url 
        feed.entries.each do |entry|
        
          
            unless exists? :guid => entry.id
              create!(
               
                :name         => entry.title.gsub(/\$[0-9a-zA-Z\.]+/, ""),
                :summary      => entry.summary,
                :url          => entry.url.gsub(/movieoverview?.*$/,"moviereviews"),
                :published_at => entry.published,
                :guid         => entry.id,
                
              )
            end
        end
    end
end
