class CreateNotificationsTable < ActiveRecord::Migration

  def up

    create_table :notifications do |t|
      t.references :user
      t.references :commit
    end

    add_index :notifications, :commit_id
    add_index :notifications, :user_id

  end

  def down

    drop_table :notifications

  end

end
