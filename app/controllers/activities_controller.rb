class ActivitiesController < ApplicationController
	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(params[:activity])
		if @activity.save
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
	end

	def destroy
		Activity.find(params[:id]).destroy
		flash[:success] = "Activity has been deleted."
		redirect_to activities_path
	end
end
