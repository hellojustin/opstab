CommitNotifier::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  resources :users, :only => [ :index, :show ] do
    resources :events, :only => [ :new, :create ]
  end

  match 'users/:search_terms', 
        :to => 'users#index', 
        :as => 'search_users'

  resources :followings, :only => [ :index, :edit, :update ]

  match 'following/:followed_user_id', 
        :via => 'post', 
        :to  => 'followings#create', 
        :as  => 'create_following'

  resources :notifications, :only => [ :index, :show ]

  resources :integrations, :only => [ :index, :show ]

  match 'integrations/downloads/:api_key/gcs/post-commit',
        :to => 'integrations/downloads/git_client_side#post_commit',
        :as => 'integrations/downloads/gcs_pc'
  
  resources :integration_downloads, :only => [ :show ]

  namespace :api do

    resources :users, :only => [ :index, :show ] do
      resources :events, :only => [ :new, :create ]
    end

  end

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

end
