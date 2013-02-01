module Notifications

  class Processor

    def process( event )
      followers = event.poster.followers
      
      users_to_notify = followers.select do |follower|
        follower.wants_to_hear_about? event
      end

      CommitNotificationMailer.commit_notification( event, users_to_notify ).deliver
    end

  end

end
