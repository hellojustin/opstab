class UsersController < ApplicationController

  before_filter :check_access
  layout        :determine_layout

  def index
    users = User.search params[ :search_terms ]
    render :locals => { :users => users, :search_terms => params[:search_terms] }
  end

  def show
    redirect_to user_events_path( :user_id => params[:id] )
  end

  private

  def determine_layout

    case action_name
    when 'index'
      'user_sidebar_layout'
    when 'edit'
      'user_sidebar_layout'
    else
      'users'
    end

  end

end
