class Following < ActiveRecord::Base

  include AASM

  belongs_to :followed_user,  :class_name => 'User'
  belongs_to :following_user, :class_name => 'User'

  aasm :column => 'state' do

    state :pending_approval, :initial => true
    state :approved
    state :cancelled

    event :approve do
      transitions :from => :pending_approval, :to => :approve
    end

    event :cancel do
      transitions :from => :approved, :to => :cancelled
    end

  end

end
