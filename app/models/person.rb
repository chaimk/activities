class Person < ActiveRecord::Base
	attr_accessible :name, :password, :password_confirmation

	validates :name, presence: true, length: { maximum: 50 }, 
		uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 8 }

	validates :password_confirmation, presence: true, length: { minimum: 8 }

	has_secure_password

	has_many :actions

end
