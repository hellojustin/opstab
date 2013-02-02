class Following < ActiveRecord::Base

  include AASM

  belongs_to :followed_user,  :class_name => 'User'
  belongs_to :following_user, :class_name => 'User'

  aasm :column => 'state' do

    state :pending_approval, :initial => true
    state :approved
    state :ignored
    state :cancelled

    event :approve do
      transitions :from => :pending_approval,
                  :to   => :approved
    end

    event :ignore do
      transitions :from => :pending_approval,
                  :to   => :ignored
    end

    event :cancel do
      transitions :from => [ :pending_approval, :approved, :ignored ], 
                  :to   => :cancelled
    end

  end

  def include?( user )
    [ self.followed_user, self.following_user ].include? user
  end

  def requester?( user )
    self.following_user == user
  end

  def approver?( user )
    self.followed_user == user
  end

end
