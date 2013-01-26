class FollowingsController < ApplicationController

  before_filter :check_access

  def index
    followings = current_user.follows( :include => :followed_user )
    render :locals => { :followings => followings }
  end

  def create
    following = Following.new( :followed_user_id  => params[ :followed_user_id ],
                               :following_user_id => current_user.id )
    following.save
    redirect_to followings_path
  end

end
