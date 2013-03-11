class SearchResultsController < ApplicationController

  before_filter :check_access

  def index
    @search_terms = params[:search_terms]
    results = Searchify.index.search( @search_terms )
    logger.debug results.inspect
    ids     = { 'user' => [], 'event' => [] }

    results['results'].each do |doc|
      id_match = doc['docid'].match /(\w+)\|(\d+)/
      type     = id_match[1]
      id       = id_match[2]
      ids[ type ] << id
    end

    @users = User.where  :id => ids['user']
    @users.sort!  { |a,b| a.name <=> b.name }

    @events = Event.where :id => ids['event']
    @events.select! { |event| current_user.follows? event.user }
    @events.sort! { |a,b| b.created_at <=> a.created_at }
  end

end
