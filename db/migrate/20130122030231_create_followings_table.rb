class CreateFollowingsTable < ActiveRecord::Migration

  def up

    create_table :followings do |t|
      t.integer :followed_user_id
      t.integer :following_user_id
    end

    add_index :followings, :followed_user_id
    add_index :followings, :following_user_id

  end

  def down

    drop_table :followings

  end

end
