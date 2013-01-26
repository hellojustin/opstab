CommitNotifier::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  resources :users, :only => [ :index, :show ]

  match 'users/:search_terms', 
        :to => 'users#index', 
        :as => 'search_users'

  resources :followings, :only => [ :index ]

  match 'following/:followed_user_id', 
        :via => 'post', 
        :to  => 'followings#create', 
        :as  => 'create_following'

  resources :commits

  resources :notifications, :only => [ :index, :show ]

  resources :integrations, :only => [ :index, :show ]
  
  resources :integration_downloads, :only => [ :show ]

end
