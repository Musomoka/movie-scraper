class AddColumnGuidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :guid, :string
  end
end
