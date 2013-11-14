class DeedsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create]
	before_filter :admin_user, only: [:edit, :update, :destroy]

	def new
		@deed = Deed.new(person_id: current_person.id)
	end

	def create
		@deed = Deed.new({ person_id: 11, activity_id: 1 })
		if @deed.save
			flash[:success] = "New deed was successfully added."
			flash[:notice] = params
			redirect_to @deed
		else
			render 'new'
		end
	end

	def index
		@deeds = Deed.all
	end

	def show
		@deed = Deed.find(params[:id])
	end

	def edit
		@deed = Deed.find(params[:id])
	end

	def update
		@deed = Deed.find(params[:id])
		if @deed.update_attributes(params[:deed])
			flash[:success] = "Deed was successfully modified."
			redirect_to @deed
		else
			render 'edit'
		end
	end

	def destroy
		Deed.find(params[:id]).destroy
		flash[:success] = "Deed has been deleted."
		redirect_to deeds_path
	end

	private
		def signed_in_user
			redirect_to signin_path, notice: "Please sign in." unless signed_in?
		end

		def admin_user
			if !current_person.admin
				flash[:error] = "Operation failed. You must be signed in as an admin-level user to manage deeds."
				redirect_to signin_path, notice: "Please sign in." 
			end
		end

end
