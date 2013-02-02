CommitNotifier::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  resources :users, :only => [ :index, :show ]

  match 'users/:search_terms', 
        :to => 'users#index', 
        :as => 'search_users'

  resources :followings, :only => [ :index, :edit, :update ]

  match 'following/:followed_user_id', 
        :via => 'post', 
        :to  => 'followings#create', 
        :as  => 'create_following'

  resources :commits

  resources :notifications, :only => [ :index, :show ]

  resources :integrations, :only => [ :index, :show ]

  match 'integrations/downloads/:api_key/git-client-side/post-commit',
        :to => 'integrations/downloads/git_client_side#post_commit',
        :as => 'integrations_downloads_git_client_side_post_commit'
  
  resources :integration_downloads, :only => [ :show ]

end
