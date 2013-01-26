class Following < ActiveRecord::Base

  belongs_to :followed_user,  :class_name => 'User'
  belongs_to :following_user, :class_name => 'User'

end
