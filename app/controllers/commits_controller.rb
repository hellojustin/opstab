require 'notifications/processor'

class CommitsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    commit      = Commit.new params[:commit]
    commit.user = User.where( :email => commit.committer ).first if commit.committer
    commit.save

    notification_processor = Notifications::Processor.new
    notification_processor.process commit

    respond_with( commit ) and return
  end

end
