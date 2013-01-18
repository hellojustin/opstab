CommitNotifier::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  resources :commits

  resources :notifications, :only => [ :index, :show, :update, :destroy ]

  resources :notification_rules

end
