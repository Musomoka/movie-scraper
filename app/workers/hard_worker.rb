class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    FeedEntry.update_from_feed("http://www.fandango.com/rss/top10boxoffice.rss")

  end

end
