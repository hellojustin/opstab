class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :followings,
           :class_name  => 'Following',
           :foreign_key => 'followed_user_id'

  has_many :follows,
           :class_name  => 'Following',
           :foreign_key => 'following_user_id'

  has_many :followers,      
           :class_name  => 'User',
           :through     => :followings,
           :source      => :following_user,
           :conditions  => { :state => 'approved' }

  has_many :followed_users, 
           :class_name  => 'User', 
           :through     => :follows,
           :source      => :followed_user,
           :conditions  => { :state => 'approved' }

  has_many :notifications

  has_many :integration_usages

  has_many :integrations, :through => :integration_usages

  def self.search( terms )
    where 'email LIKE ?', "%#{terms}%" 
  end

  def initialize( params = {} )
    super( params )
    self.api_key = SecureRandom.uuid
  end

  def follows?( user )
    followed_users.include? user
  end

  def wants_to_hear_about?( event )
    true
  end

end
