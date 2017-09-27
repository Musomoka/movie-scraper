class AddColumnReviewsToFeedEntry < ActiveRecord::Migration
  def change
    add_column :feed_entries, :reviews, :text
  end
end
