class PeopleController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]

	def new
		@person = Person.new
	end

	def create
		@person = Person.new(params[:person])
		if @person.save
			sign_in @person
			flash[:success] = "New person was successfully added."
			redirect_to @person
		else
			render 'new'
		end
	end

	def index
		@people = Person.all
	end

	def show
		@person = Person.find(params[:id])
	end

	def edit
		# no code needed because of before_filter :correct_user
	end

	def update
		# before_filter :correct_user finds the user
		if @person.update_attributes(params[:person])
			flash[:success] = "Person was successfully modified."
			redirect_to @person
		else
			render 'edit'
		end
	end

	def destroy
		Person.find(params[:id]).destroy
		flash[:success] = "Person has been deleted."
		redirect_to people_path
	end

	private
		def signed_in_user
			redirect_to signin_path, notice: "Please sign in." unless signed_in?
		end

		def correct_user
			@person = Person.find(params[:id])
			if !current_person?(@person)
				flash[:error] = "You are not authorized to edit user #{@person.name}."
				redirect_to(root_path)
			end
		end

end