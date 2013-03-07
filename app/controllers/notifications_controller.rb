class NotificationsController < ApplicationController

  before_filter :check_access
  layout        :determine_layout

  def index
    @user          = current_user
    @notifications = @user.notifications.sort { |a,b| a.created_at <=> b.created_at }
  end

  def show
    @notification = Notification.find( params[:id] )
    @user         = current_user
    
    if @notification.user != current_user 
      render :status => 404
    end
  end

  private

  def determine_layout

    case action_name
    when 'index'
      'user_sidebar_layout'
    else
      'application'
    end

  end

end
