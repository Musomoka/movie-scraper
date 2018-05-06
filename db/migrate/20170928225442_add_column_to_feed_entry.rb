class AddColumnToFeedEntry < ActiveRecord::Migration
  def change
    add_column :feed_entries, :word, :text
  end
end
