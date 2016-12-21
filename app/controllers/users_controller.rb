class UsersController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @boats = current_user.boats
    @boat = Boat.new
  end

  def update
  end

  def destroy
  end
end
