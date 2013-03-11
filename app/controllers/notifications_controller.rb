class NotificationsController < ApplicationController

  before_filter :check_access
  layout        :determine_layout

  def index
    @user          = current_user
    @notifications = @user.notifications.sort { |a,b| b.created_at <=> a.created_at }
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
