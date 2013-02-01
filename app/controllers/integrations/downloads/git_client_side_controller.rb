class Integrations::Downloads::GitClientSideController < ApplicationController

  before_filter :check_access

  def post_commit
    
    render :locals => { :user => current_user }, :layout => false, :content_type => 'text/plain'

  end

end
