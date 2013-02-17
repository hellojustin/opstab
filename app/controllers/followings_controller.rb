class FollowingsController < ApplicationController

  before_filter :check_access

  def index

    render :locals => { :followed_users => current_user.followed_users }

  end

  def create

    following = Following.new( :followed_user_id  => params[ :followed_user_id ],
                               :following_user_id => current_user.id )
    following.save

    FollowingsMailer.follow_request( following ).deliver

    redirect_to followings_path

  end

  def edit

    following = Following.find( params[:id], 
                                :include => [:followed_user, :following_user] )
    
    if following.include? current_user
      render :locals => { :following => following }
    else
      redirect_to followings_path
    end

  end

  def update
    
    following = Following.find params[:id]

    if    params[ :approve ] and following.approver? current_user
      following.approve!
    elsif params[ :ignore ]  and following.approver? current_user
      following.ignore!
    elsif params[ :cancel ]  and following.requester? current_user
      following.cancel!
    end

    redirect_to followings_path

  end

end
