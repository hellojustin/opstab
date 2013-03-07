class NotificationMailer < ActionMailer::Base

  add_template_helper NotificationsHelper
  add_template_helper UsersHelper

  def notification( notification, users_to_notify )

    @notification = notification
    
    recipients = users_to_notify.map( &:email )

    mail( :to      => recipients,
          :from    => @notification.event.user.email,
          :subject => "#{@notification.event.kind} from #{@notification.event.user.name}" )

  end

end
