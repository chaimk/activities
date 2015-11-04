class Deed < ActiveRecord::Base
	attr_accessible :activity_id, :person_id, :points, :performed_at
  
  validates :performed_at, presence: true
  validates :points, presence: true, 
    numericality: { only_integer: true, greater_than: 0, less_than: 15 }
  
  default_scope { order(performed_at: :desc) }

	belongs_to :person
	belongs_to :activity

end
