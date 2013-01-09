class CommitNotificationMailer < ActionMailer::Base

  def commit_notification( commit )

    @commit = commit
    
    recipients = [ 'jmolineaux@customink.com', 
                   'acardy@customink.com', 
                   'rfields@customink.com', 
                   'jborn@customink.com' ]

    mail( :to      => recipients,
          :from    => 'notify@hellojustin.net',
          :subject => "Commit #{commit.comment}" )

  end

end
