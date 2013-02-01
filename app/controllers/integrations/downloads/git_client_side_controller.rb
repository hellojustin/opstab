class Integrations::Downloads::GitClientSideController < ApplicationController

  before_filter :check_access

  def post_commit
    
    render :locals => { :user => current_user }

  end

end
