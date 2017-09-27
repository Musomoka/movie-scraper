class AddFeedEntryIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :feed_entry, index: true, foreign_key: true
  end
end
