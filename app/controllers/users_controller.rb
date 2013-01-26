class UsersController < ApplicationController

  before_filter :check_access

  def index
    users = User.search params[ :search_terms ]
    render :locals => { :users => users, :search_terms => params[:search_terms] }
  end

  def show
    user            = User.find params[:id]

    followed_users  = user.followed_users
    following_users = user.followers

    integrations    = user.integrations
    notifications   = user.notifications
    
    render :locals  => { :user                => user,
                         :followed_users      => followed_users,
                         :following_users     => following_users,
                         :integrations_in_use => integrations,
                         :notifications       => notifications }
  end

end
