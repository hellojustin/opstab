class CreateCommitsTable < ActiveRecord::Migration

  def up

    create_table :commits do |t|
      t.string     :branch
      t.text       :comment
      t.string     :committer
      t.references :user
      t.datetime   :date
      t.string     :repository
      t.string     :revision
      t.text       :diff
    end

    add_index :commits, :branch
    add_index :commits, :comment
    add_index :commits, :committer
    add_index :commits, :date
    add_index :commits, :repository
    add_index :commits, :revision
    add_index :commits, :diff

  end

  def down

    drop_table :commits 

  end

end
