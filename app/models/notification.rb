class Notification < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  after_save :deliver

  def summary
    "#{ event.user.email } performed a #{ event.kind }"
  end

  private
  
  def deliver
    users = [ user ]
    NotificationMailer.notification( event, users ).deliver
  end


end
