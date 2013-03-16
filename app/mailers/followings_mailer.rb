class FollowingsMailer < ActionMailer::Base

  def follow_request( following )

    @following      = following
    @following_user = following.following_user
    @followed_user  = following.followed_user

    mail( :to      => following.followed_user.email,
          :from    => 'notifications@opstab.com',
          :subject => "#{following.following_user.name} would like to follow you on OpsTab." )

  end

end
