class MailPreview < MailView

  def notification
  
    event           = Event.first
    users_to_notify = User.all

    NotificationMailer.notification( event, users_to_notify )

  end

end
