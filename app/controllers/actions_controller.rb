class ActionsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create]
	before_filter :admin_user, only: [:edit, :update, :destroy]

	def new
		@action = Action.new(person_id: current_person.id)
	end

	def create
		@action = Action.new({ person_id: 11, activity_id: 1 })
		if @action.save
			flash[:success] = "New action was successfully added."
			flash[:notice] = params
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

	private
		def signed_in_user
			redirect_to signin_path, notice: "Please sign in." unless signed_in?
		end

		def admin_user
			if !current_person.admin
				flash[:error] = "Operation failed. You must be signed in as an admin-level user to manage actions."
				redirect_to signin_path, notice: "Please sign in." 
			end
		end

end
