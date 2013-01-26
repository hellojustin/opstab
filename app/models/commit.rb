class Commit < ActiveRecord::Base

  alias_attribute :poster, :user

end
