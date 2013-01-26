class IntegrationsController < ApplicationController
  
  before_filter :check_access

  def index
    render :locals => { :integrations => Integration.all }
  end

  def show
    render :locals => { :integration => Integration.find( params[:id] ) }
  end

end
