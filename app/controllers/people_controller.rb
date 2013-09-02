class PeopleController < ApplicationController
  def new
  end

  def show
  		@person = Person.find(params[:id])
  end

  def index
  		@people = Person.all
  end

  def edit
  end

  def delete
  end
end
