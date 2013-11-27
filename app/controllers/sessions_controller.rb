class SessionsController < ApplicationController

	def new
	end

	def create
		person = Person.where('lower(name) = ?', params[:session][:name].downcase).first
		if person && person.authenticate(params[:session][:password])
			sign_in(person)
			flash[:success] = "#{current_person.name} is now signed in."
			# redirect_to root_path
			redirect_back_or person
			
      # Sign the user in and redirect to the user's show page.
		else
			flash.now[:error] = 'Invalid name/password combination. Please try again.'
			render 'new'
		end
	end

	def destroy
		current_name = current_person.name
		sign_out
		flash[:success] = "#{current_name} was signed out successfully."
		redirect_back_or root_path
	end

end
