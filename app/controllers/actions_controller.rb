class ActionsController < ApplicationController

	def new
		@action = Action.new
	end

	def create
		@action = Action.new(params[:action])
		if @action.save
			flash[:success] = "New action was successfully added."
			redirect_to @action
		else
			render 'new'
		end
	end

	def index
		@actions = Action.all
	end

	def show
		@action = Action.find(params[:id])
	end

	def edit
		@action = Action.find(params[:id])
	end

	def update
		@action = Action.find(params[:id])
		if @action.update_attributes(params[:action])
			flash[:success] = "Action was successfully modified."
			redirect_to @action
		else
			render 'edit'
		end
	end

	def destroy
		Action.find(params[:id]).destroy
		flash[:success] = "Action has been deleted."
		redirect_to actions_path
	end
end
