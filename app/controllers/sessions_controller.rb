class SessionsController < ApplicationController

	def new
	end

	def create
		person = Person.where('lower(name) = ?', params[:session][:name].downcase).first
		if person && person.authenticate(params[:session][:password])
			flash[:success] = 'User was signed in successfully, but no way to view it at the moment...'
			redirect_to person
      # Sign the user in and redirect to the user's show page.
		else
			flash.now[:error] = 'Invalid name/password combination'
			render 'new'
		end
	end

	def destroy
	end

end
