class CommitNotificationMailer < ActionMailer::Base

  def commit_notification( commit )
    
    mail( :to      => 'justin.molineaux@gmail.com',
          :from    => 'justin.molineaux@gmail.com',
          :subject => 'Commit Notification!' )


  end

end
