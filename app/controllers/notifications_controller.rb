class NotificationsController < ApplicationController

  before_filter :check_access

  def index
    current_user_email = current_user.email
    followed_users     = current_user.followed_users
    following_users    = current_user.followers

    notifications      = Notification.where( :user_id => current_user.id )

    render :locals  => { :current_user_email => current_user_email,
                         :followed_users     => followed_users,
                         :following_users    => following_users,
                         :notifications      => notifications }
  end

  def show
    render :locals => { :notification => Notification.find( params[:id] ) }
  end

end
