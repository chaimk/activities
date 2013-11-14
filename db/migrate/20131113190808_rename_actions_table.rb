class RenameActionsTable < ActiveRecord::Migration
    def change
        rename_table :actions, :deeds
    end 
end
