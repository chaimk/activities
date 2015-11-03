class AddPerformedAtToDeeds < ActiveRecord::Migration
  def change
    add_column :deeds, :performed_at, :datetime
  end
end
