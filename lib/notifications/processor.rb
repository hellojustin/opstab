class Notifications::Processor

  def process( event )
    CommitNotificationMailer.commit_notification( event ).deliver
  end

end
