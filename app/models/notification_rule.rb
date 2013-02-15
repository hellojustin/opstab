class NotificationRule < ActiveRecord::Base

  belongs_to :user

  def applies_to?( event )
    true
  end

  def apply( event )
    if applies_to? event
      Notification.create :user_id => user.id, :event_id => event.id
    end
  end

end
