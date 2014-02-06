class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.integer :person_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
