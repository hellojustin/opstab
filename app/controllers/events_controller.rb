class EventsController < ApplicationController

  before_filter :check_access

  respond_to :json

  def new    

    render :locals => { :event => Event.new, :user => current_user }
  
  end

  def create

    event_user = User.find params[ :user_id ]

    if event_user and event_user == current_user

      event      = Event.new params[ :event ]
      event.user = event_user
      event.save

      redirect_to notifications_path, :flash => { :notice => 'Your event was created successfully.' } 

    else

      redirect_to :new

    end

  end

end
