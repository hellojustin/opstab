class CreateIntegrationTable < ActiveRecord::Migration

  def up

    create_table :integrations do |t|
      t.string :name
      t.string :description
    end

  end

  def down

    drop_table :integrations

  end

end
