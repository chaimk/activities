class SessionsController < ApplicationController

	def new
	end

	def create
		person = Person.where('lower(name) = ?', params[:session][:name].downcase).first
		if person && person.authenticate(params[:session][:password])
			sign_in(person)
			flash[:success] = "#{current_person.name} is now signed in."
			redirect_back_or person
      # Sign the user in and redirect to the user's show page.
		else
			redirect_to signin_path, alert: "Invalid name/password combination. Please try again."
		end
	end

	def destroy
		current_name = current_person.name
		sign_out
		flash[:success] = "#{current_name} was signed out successfully."
		redirect_back_or root_path
	end

end
