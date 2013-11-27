class AddPointsToDeeds < ActiveRecord::Migration
  def change
    add_column :deeds, :points, :int
  end
end
