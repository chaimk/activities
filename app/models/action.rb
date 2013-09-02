class Action < ActiveRecord::Base
  attr_accessible :activity_id, :person_id

  belongs_to :person
  belongs_to :activity
end
