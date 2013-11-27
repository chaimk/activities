class DeedsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create]
	before_filter :admin_user, only: [:edit, :update, :destroy]

	def new
		@deed = Deed.new(person_id: current_person.id)
	end

	def create
		@deed = Deed.new(params[:deed])
		@deed.points = @deed.activity.points
		if @deed.save
			flash[:success] = "New deed was successfully added."
			# flash[:notice] = params
			redirect_to deeds_path
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
			redirect_to deeds_path
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
			if !signed_in?
				store_location
				redirect_to signin_path, notice: "Please sign in."
			end
		end

		def admin_user
			if !signed_in_as_admin?
				store_location
				flash[:error] = "Operation failed. You must be signed in as an admin-level user to manage deeds."
				redirect_to signin_path, notice: "Please sign in." 
			end
		end

end
