class CommitNotificationMailer < ActionMailer::Base

  def commit_notification( commit )

    @commit = commit
    
    mail( :to      => 'notifications@hellojustin.net',
          :from    => 'notify@hellojustin.net',
          :subject => 'Commit Notification!' )


  end

end
