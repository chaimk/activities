class Action < ActiveRecord::Base
  attr_accessible :activity_id, :person_id

  belongs_to :person
end
