require 'notifications/processor'

class CommitsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    user = User.where( :api_key => params[:api_key] ).first

    if params[:api_key] and user

      commit      = Commit.new params[:commit]
      commit.user = user
      commit.save

      notification_processor = Notifications::Processor.new
      notification_processor.process commit

      respond_with( commit ) and return

    else

      message = "Error 403, you don't have permissions for this operation."
      respond_with( { :error   => true, :message => message } ) and return

    end
  end

end
