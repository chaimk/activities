class PeopleController < ApplicationController
	include ApplicationHelper

	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]

	def new
		@person = Person.new
	end

	def create
		if ( !signed_in? || !current_person.admin )
			flash[:error] = "Operation failed. You must be signed in as an admin-level user to manage people."
			redirect_to signin_path, notice: "Please sign in." 
		else
			@person = Person.new(params[:person])
			if @person.save
				flash[:success] = "New person was successfully added."
				flash[:notice] = params
				redirect_to @person
			else
				flash[:error] = "An error occurred when attempting to add a new person."
				render 'new'
			end
		end
	end

	def index
		@people = Person.order("name")
	end

	def show
		@person = Person.find(params[:id])
		date_range = Date.current.beginning_of_week...(Date.current + 1)
		@person_deeds_this_week = Deed.joins(:person).where(deeds: { created_at: date_range, person_id: params[:id] }).order("created_at desc")
	end

	def show_all_deeds
		@person = Person.find(params[:id])
		@person_deeds = @person.deeds.order("created_at desc")
		@person_deeds_count = @person.deeds.sum(:points)
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
		@person = Person.find(params[:id])
		if !current_person.admin
			flash[:error] = "Operation failed. Only admin-level users are authorized to manage people. Sign in as an admin user and try again."
		else  # current person IS an admin, but:
			if current_person?(@person)
				flash[:error] = "You are not permitted to delete yourself!"
			else # current person is admin and you're not deleting yourself:
				@person.destroy
				flash[:success] = "Person has been deleted."
			end
		end
		redirect_to people_path
	end

	private
		def signed_in_user
			unless signed_in?
				store_location
				redirect_to signin_path, notice: "Please sign in."
			end
		end

		def correct_user
			@person = Person.find(params[:id])
			if ( !current_person?(@person) && !current_person.admin )
				flash[:error] = "You are not authorized to edit user #{@person.name}."
				redirect_to(root_path)
			end
		end

end