class ActivitiesController < ApplicationController
	before_filter :admin_user, only: [:create, :update, :destroy]

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(params[:activity])
		if @activity.save
			flash[:success] = "New activity was successfully added."
			redirect_to @activity
		else
			render 'new'
		end
	end

	def index
		@activities = Activity.all
	end

	def show
		@activity = Activity.find(params[:id])
	end

	def edit
		@activity = Activity.find(params[:id])
	end

	def update
		@activity = Activity.find(params[:id])
		if @activity.update_attributes(params[:activity])
			flash[:success] = "Activity was successfully modified."
			redirect_to @activity
		else
			render 'edit'
		end
	end

	def destroy
		Activity.find(params[:id]).destroy
		flash[:success] = "Activity has been deleted."
		redirect_to activities_path
	end

	private
		def admin_user
			if ( !signed_in? || !current_person.admin )
				flash[:error] = "Operation failed. You must be signed in as an admin-level user to manage activities."
				redirect_to signin_path, notice: "Please sign in."
			end
		end

end