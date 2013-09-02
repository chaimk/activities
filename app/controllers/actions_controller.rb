class ActionsController < ApplicationController
  def new
  end

  def show
  		@actions = Action.all
  end

  def edit
  end

  def delete
  end
end
