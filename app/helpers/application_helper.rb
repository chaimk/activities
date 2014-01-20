module ApplicationHelper
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

	def signed_in_as_admin?
		signed_in? && current_person.admin
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || root_path)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.fullpath unless ( request.fullpath == "/signin" || request.fullpath == "/sessions" )
	end

end
