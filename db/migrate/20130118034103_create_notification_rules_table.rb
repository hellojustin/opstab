class CreateNotificationRulesTable < ActiveRecord::Migration

  def up
    
    create_table :notification_rules do |t|
      t.references :user
      t.string     :action
      t.string     :repository_expr
      t.string     :branch_expr
      t.string     :committer_expr
      t.string     :comment_expr
    end

    add_index :notification_rules, :user_id
    add_index :notification_rules, :action

  end

  def down

    drop_table :notification_rules
  
  end

end
