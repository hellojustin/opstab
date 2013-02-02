class FollowingsMailer < ActionMailer::Base

  def follow_request( following )

    @following      = following
    @following_user = following.following_user
    @followed_user  = following.followed_user

    mail( :to      => following.followed_user.email,
          :from    => 'notify@hellojustin.net',
          :subject => "#{following.following_user.email} would like to follow you on the HelloJustin.net Notifier." )

  end

end
