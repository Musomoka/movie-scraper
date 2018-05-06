Rails.application.routes.draw do
root 'feed_entries#index'





  resources :feed_entries do
     resources :reviews
        member do
       get  :review_query
       post :review_query
       get  :library, to: 'reviews#words'


      end


    post :word_sanitize
    get  :word_sanitize
    end



end


