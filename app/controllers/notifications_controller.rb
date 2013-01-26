class NotificationsController < ApplicationController

  before_filter :check_access

  def index
    followed_users  = current_user.followed_users
    following_users = current_user.followers

    notifications   = current_user.notifications

    render :locals  => { :user            => current_user,
                         :followed_users  => followed_users,
                         :following_users => following_users,
                         :notifications   => notifications }
  end

  def show
    render :locals  => { :notification => Notification.find( params[:id] ) }
  end

end
