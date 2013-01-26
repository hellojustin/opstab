class AddInstructionsToIntegrationsTable < ActiveRecord::Migration

  def change
    
    add_column :integrations, :instructions, :text

  end

end
