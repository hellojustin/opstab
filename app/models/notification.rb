class Notification < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  after_save :deliver

  private
  
  def deliver
    users = [ user ]
    NotificationMailer.notification( self, users ).deliver
  end


end
