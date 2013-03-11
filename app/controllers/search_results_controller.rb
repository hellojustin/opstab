class SearchResultsController < ApplicationController

  before_filter :check_access

  def index
    @search_terms = params[:search_terms]
    
    user_results  = Searchify.index.search( "#{@search_terms} class:User" )
    event_results = Searchify.index.search( "#{@search_terms} class:Event" )

    user_ids      = user_results['results'].map  { |doc| get_model_id doc }
    event_ids     = event_results['results'].map { |doc| get_model_id doc }

    @users        = User.where  :id => user_ids
    @users.sort!  { |a,b| a.name <=> b.name }

    @events       = Event.where :id => event_ids
    @events.select! { |event| current_user.follows? event.user }
    @events.sort! { |a,b| b.created_at <=> a.created_at }
  end

  private
  
  def get_model_id( doc )
    id_match = doc['docid'].match /(\w+)\|(\d+)/
    id_match[2].to_i
  end

end
