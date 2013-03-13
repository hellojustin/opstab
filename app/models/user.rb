class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, 
                  :remember_me, :description, :api_key

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
           :conditions  => { 'followings.state' => 'approved' }

  has_many :followed_users, 
           :class_name  => 'User', 
           :through     => :follows,
           :source      => :followed_user,
           :conditions  => { 'followings.state' => 'approved' }
  
  has_many :events

  has_many :notifications

  has_many :notification_rules

  has_many :integration_usages

  has_many :integrations, :through => :integration_usages

  validates_presence_of :name

  after_save :update_searchify_index

  before_destroy :remove_from_searchify_index

  def initialize( params = {} )
    super( params )
    self.api_key = SecureRandom.uuid
  end

  def follows?( user )
    followed_users.include? user
  end

  def pending_follows
    follows( :include => :followed_user ).select do |f| 
      f.pending_approval? or f.ignored? 
    end
  end

  def requested_follows
    followings( :include => :following_user ).select do |f|
      f.pending_approval?
    end
  end

  def notify!( event )
    notification_rules.each do |rule|
      rule.apply( event )
    end
  end

  def notification_rules
    [ NotificationRule.new( :user_id => self.id ) ]
  end

  def update_searchify_index
    index_params = {
      :name        => self.name.to_s,
      :email       => self.email.to_s,
      :description => self.description.to_s
    }
    index_params.merge!( { :text  => index_params.values.to_yaml } )
    index_params.merge!( { :class => self.class.to_s } )
    Searchify.index.document( "#{self.class.to_s}|#{self.id}" ).add( index_params )
  end

  def remove_from_searchify_index
    Searchify.index.document( "#{self.class.to_s}|#{self.id}" ).delete
  end

end
