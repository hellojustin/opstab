class NotificationRulesController < ApplicationController

  before_filter :check_access

  def index
    notification_rules = NotificationRule.where( :user_id => current_user.id )
    render :locals => { :notification_rules => notification_rules }
  end

  def new
    notification_rule = NotificationRule.new
    render :locals => { :notification_rule => notification_rule }
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
