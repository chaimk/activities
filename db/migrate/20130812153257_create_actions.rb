class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.integer :peopleID
      t.integer :activityID

      t.timestamps
    end
  end
end
