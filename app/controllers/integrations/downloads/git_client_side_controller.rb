class Integrations::Downloads::GitClientSideController < ApplicationController

  def post_commit
    
    user = User.where( :api_key => params[:api_key] ).first

    if user
      render :locals       => { :user => user }, 
             :layout       => false, 
             :content_type => 'text/plain'
    else
      render :status       => 404
    end

  end

end
