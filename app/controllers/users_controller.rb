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
    
    pending_follows = user.follows( :include => :followed_user )
    pending_follows.select! { |f| f.pending_approval? or f.ignored? }

    requested_follows = user.followings( :include => :following_user )
    requested_follows.select! { |f| f.pending_approval? }

    integrations    = user.integrations
    notifications   = user.notifications
    
    render :locals  => { :user                => user,
                         :pending_follows     => pending_follows,
                         :requested_follows   => requested_follows,
                         :followed_users      => followed_users,
                         :following_users     => following_users,
                         :integrations_in_use => integrations,
                         :notifications       => notifications }
  end

end
