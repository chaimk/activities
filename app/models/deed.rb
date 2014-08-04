class Deed < ActiveRecord::Base
	attr_accessible :activity_id, :person_id, :points

	belongs_to :person
	belongs_to :activity

	def created_this_week?
		Date.current.beginning_of_week == created_at.beginning_of_week
	end

end
