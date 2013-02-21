class NotificationsController < ApplicationController

  before_filter :check_access

  layout 'user_sidebar_layout'

  def index
    render :locals => { :notifications => current_user.notifications }
  end

  def show
    render :locals => { :notification => Notification.find( params[:id] ) }
  end

end
