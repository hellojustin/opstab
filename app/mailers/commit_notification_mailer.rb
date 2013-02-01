class CommitNotificationMailer < ActionMailer::Base

  def commit_notification( commit, users_to_notify )

    @commit = commit
    
    recipients = users_to_notify.map( &:email )

    mail( :to      => recipients,
          :from    => 'notify@hellojustin.net',
          :subject => "Commit #{commit.comment}" )

  end

end
