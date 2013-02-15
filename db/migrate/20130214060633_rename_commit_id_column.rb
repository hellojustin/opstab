class RenameCommitIdColumn < ActiveRecord::Migration
  def up
    rename_column :notifications, :commit_id,  :event_id
    add_column    :notifications, :created_at, :datetime
    add_column    :notifications, :updated_at, :datetime

    add_index :notifications, :event_id
  end

  def down
    rename_column :notifications, :event_id,   :commit_id
    remove_column :notifications, :created_at, :datetime
    remove_column :notifications, :updated_at, :datetime

    add_index :notifications, :commit_id
  end
end
