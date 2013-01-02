class CommitsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    commit = Commit.new( params[:commit] )
    CommitNotificationMailer.commit_notification( commit ).deliver
    
    respond_with( commit ) and return
  end

end
