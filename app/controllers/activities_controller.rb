class ActivitiesController < ApplicationController
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
end