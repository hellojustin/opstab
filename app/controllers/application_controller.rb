class ApplicationController < ActionController::Base

  include UsersHelper
  include DeviseRedirectsHelper

  protect_from_forgery

  private

  def check_access
    redirect_to root_path and return unless current_user
  end

end
