require 'notifications/processor'

class EventsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [ :create ]

  respond_to :json

  def new
  end

  def create
    user = User.where( :api_key => params[:api_key] ).first

    if params[:api_key] and user

      event      = Event.new params[:event]
      event.user = user
      event.save

      notification_processor = Notifications::Processor.new
      notification_processor.process event

      respond_with( event ) and return

    else

      Rails.logger.warn "Request made with invalid api_key: #{params[:api_key]}. Returning 403."
      message = "Error 403, you don't have permissions for this operation."
      respond_with( { :error   => true, :message => message } ) and return

    end
  end

end
