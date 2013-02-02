class CreateEventsTable < ActiveRecord::Migration

  def up
    
    create_table :events do |t|
      t.references :user
      t.string     :type, :default => 'unkown'
      t.text       :data
      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, :type
    add_index :events, :data
    add_index :events, :created_at
    add_index :events, :updated_at

  end

  def down

    drop_table :events

  end

end
