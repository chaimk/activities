class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.string :peopleID
      t.string :activityID

      t.timestamps
    end
  end
end
