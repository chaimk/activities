class Deed < ActiveRecord::Base
	attr_accessible :activity_id, :person_id, :points

	belongs_to :person
	belongs_to :activity

end
