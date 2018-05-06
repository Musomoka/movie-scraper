class Review < ActiveRecord::Base
    require 'mechanize'
    require 'open-uri'
    require 'stopwords'

    belongs_to :feed_entry
    attr_accessor :movie_feed_id, :movie_feed_url


    def self.query(feedentry_id,movie_url)

     #add initial link
     page = Mechanize.new

      page.get(movie_url) do |current_page|

       50.times do
       #scan page for content 1st NOKOGIRI
         current_page.search("//div[@class='movie-review-item-content']").each do |content|

          content = content.text


          sieve = Stopwords::Snowball::WordSieve.new
          content = sieve.filter lang: :en, words: content.split
          content =  content.join(" ")

          content = PragmaticSegmenter::Segmenter.new(text: content)

          review_list = []
           content.segment.each do |sentence|

              review_list = review_list.push(sentence)


           end
            create!(

            :feed_entry_id => feedentry_id,
            :body => review_list
            )

          current_page = current_page.link_with(:text => 'More Reviews').click

        end

      end
     end

    end





end

