class BoatsController < ApplicationController
  def index
  end


  def new
    @boat = Boat.new
  end

  def create
    @boat = current_user.boats.new(boat_params)

    respond_to do |format|
      if @boat.save
        # flash[:notice] = "Boat Added!" #for not AJAX
        format.js 
        # redirect_to user_path(current_user) # for not AJAX
      else
        format.json { render json: { error: @boat.errors.full_messages }, status: 422 }
        # flash[:alert] = "Boat not added. Must have a unique name." #for not AJAX
        # render new_boat_path # for not AJAX
      end
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def show
  end

  def update #UJS method now!
    @boat = Boat.find(params[:id])
    if @boat.update_attributes(boat_params)
      respond_to do |format|
        format.js
        format.json { render json: @boat }
      end
      # flash[:notice] = "#{@boat.name} updated!" #for not AJAX
      # redirect_to user_path(current_user)
    else
      # flash[:alert] = "Boat not updated. Must have a unique name." #for not AJAX
      # redirect_to edit_boat_path(@boat)
    end
  end

  def destroy
    @boat = Boat.find(params[:id])

    respond_to do |format|
      if @boat.destroy
        format.js
        # flash[:notice] = "You sunk it!" #for not AJAX
      else
        # flash[:notice] = "You didn't sink it, dude!" #for not AJAX
      end
        # redirect_to user_path(current_user) #for not AJAX
    end
  end

  private
  def boat_params
    params.require(:boat).permit(:name,:location,:max_containers, :avatar)
  end
end
