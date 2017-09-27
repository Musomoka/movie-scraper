class AddFeedEntryIdToLibrary < ActiveRecord::Migration
  def change
    add_reference :libraries, :feed_entry, index: true, foreign_key: true
  end
end
