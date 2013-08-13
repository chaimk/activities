class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :peopleID
      t.string :activityID

      t.timestamps
    end
  end
end
