class AddStatusToFollowingsTable < ActiveRecord::Migration

  def change
  
    add_column :followings, :state, :string, :default => 'pending_approval'

  end

end
