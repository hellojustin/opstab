class RenameEventTypeColumn < ActiveRecord::Migration
  def up
    rename_column :events, :type, :kind
  end

  def down
    rename_column :events, :kind, :type
  end
end
