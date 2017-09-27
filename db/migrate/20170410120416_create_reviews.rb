class CreateReviews < ActiveRecord::Migration
      def change  
        create_table :reviews do |t|
            t.string   :movie
            t.string   :author
            t.string   :body
           
            t.timestamps null: false
      end
    end
   
end