class Activity < ActiveRecord::Base
	attr_accessible :name, :points, :category

	validates :name, presence: true, length: { maximum: 50 }, 
		uniqueness: { case_sensitive: false }
	validates :points, presence: true, 
		:numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
	validates :category, presence: true

	has_many :deeds, dependent: :destroy

  default_scope { order({category: :asc}, name: :asc) }

end
