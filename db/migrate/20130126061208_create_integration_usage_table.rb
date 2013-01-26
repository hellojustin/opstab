class CreateIntegrationUsageTable < ActiveRecord::Migration

  def up

    create_table :integration_usages do |t|
      t.references :user
      t.references :integration
      t.datetime   :last_used
    end

    add_index :integration_usages, :user_id
    add_index :integration_usages, :integration_id

  end

  def down

    drop_table :integration_usages
    
  end

end
