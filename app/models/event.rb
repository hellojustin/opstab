class Event < ActiveRecord::Base

  belongs_to :user
  has_many   :notifications

  alias_attribute :poster, :user
  serialize  :data, Hash

  after_save :distribute
  after_save :update_searchify_index

  before_destroy :remove_from_searchify_index

  def update_searchify_index
    index_params = {
      :user_name  => self.user.name.to_s,
      :user_email => self.user.email.to_s,
      :kind       => self.kind.to_s,
      :summary    => self.summary.to_s
    }
    index_params.merge! self.data
    index_params.merge!( { :text  => index_params.values.to_yaml } )
    index_params.merge!( { :class => self.class.to_s } )
    Searchify.index.document( "#{self.class.to_s}|#{self.id}" ).add( index_params )
  end

  def remove_from_searchify_index
    Searchify.index.document( "#{self.class.to_s}|#{self.id}" ).delete
  end

  private
  
  def distribute
    user.followers.each do |following_user|
      following_user.notify! self
    end
  end

end
