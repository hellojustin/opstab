class NotificationMailer < ActionMailer::Base

  def notification( event, users_to_notify )

    @event = event
    
    recipients = users_to_notify.map( &:email )

    mail( :to      => recipients,
          :from    => event.user.email,
          :subject => "#{event.kind} Event Notification" )

  end

end
