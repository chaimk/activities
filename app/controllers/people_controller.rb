class PeopleController < ApplicationController
	def new
		@person = Person.new
	end

	def create
		@person = Person.new(params[:person])
		if @person.save
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
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])
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
end