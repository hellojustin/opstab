class UsersController < ApplicationController

  before_filter :check_access

  layout 'user_sidebar_layout'

  def index
    users = User.search params[ :search_terms ]
    render :locals => { :users => users, :search_terms => params[:search_terms] }
  end

  def show
    user = User.find params[:id]
    render :locals => { :notifications => user.notifications }
  end

end
