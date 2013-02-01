class Commit < ActiveRecord::Base

  belongs_to :user

  alias_attribute :poster, :user

end
