class RemoveIndexFromEventData < ActiveRecord::Migration
  def up
    remove_index :events, :data
  end

  def down
    add_index :events, :data
  end
end
