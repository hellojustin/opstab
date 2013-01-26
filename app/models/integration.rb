class Integration < ActiveRecord::Base

  has_many :integration_usages

  has_many :users, :through => :integration_usages

end
