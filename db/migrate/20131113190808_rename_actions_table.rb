class RenameActionsTable < ActiveRecord::Migration
  def self.up
    rename_table :actions, :deeds
  end

  def self.down
    rename_table :deeds, :actions
  end
end
