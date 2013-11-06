module SessionsHelper
	def sign_in(person)
		cookies.permanent[:remember_token] = person.remember_token
		self.current_person = person
	end

	def signed_in?
		!current_person.nil?
	end

	def current_person=(person)
		@current_person = person
	end

	def current_person
		@current_person ||= Person.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		self.current_person = nil
		cookies.delete(:remember_token)
	end

	def current_person?(person)
		current_person == person
	end

end
