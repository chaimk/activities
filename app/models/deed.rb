class Deed < ActiveRecord::Base
	attr_accessible :activity_id, :person_id, :points

  default_scope { order(created_at: :desc) }

	belongs_to :person
	belongs_to :activity

end
