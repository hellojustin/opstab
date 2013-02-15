class Event < ActiveRecord::Base

  belongs_to :user
  has_many   :notifications

  alias_attribute :poster, :user
  serialize  :data, Hash

  after_save :distribute

  private
  
  def distribute
    user.followers.each do |following_user|
      following_user.notify! self
    end
  end

end
