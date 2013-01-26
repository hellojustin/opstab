class UsersController < ApplicationController

  before_filter :check_access

  def index
    
    users = User.search params[ :search_terms ]
    render :locals => { :users => users, :search_terms => params[:search_terms] }

  end

end
