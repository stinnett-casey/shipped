class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def ajax_index
    @boat = Boat.find(params[:boat_id])
    #job_ids_with_boat will hold job ids that have an assoc. record with @boat
    job_ids_with_boat = [] 
    BoatJob.where(boat_id: @boat.id).each do |boat_job| #find all boat_jobs with @boat.id
      job_ids_with_boat.push boat_job.job_id
    end
    job_ids_with_boat.uniq! #Remove all duplicates
    #get all jobs that are not the ones already associated with @boat
    @jobs = job_ids_with_boat.empty? ? Job.all : Job.where("id NOT IN (?)", job_ids_with_boat)
  end

  def create # done through UJS now
    @boat = Boat.find(params[:boat][:boat_id])
    @job = @boat.jobs.new(job_params)
    respond_to do |format|
      if @job.save
        @boat.jobs << @job
        format.js
      else
        format.json { render :json => { :error => @job.errors.full_messages.to_sentence }, :status => 422 }
      end
    end


    # @boat = Boat.find(params[:boat][:boat_id])
    # @job = @boat.jobs.new(job_params)
    # if @boat.jobs << @job
    #   flash[:notice] = "Job[#{@job.name}] created!"
    #   redirect_to user_path(current_user)
    # else
    #   @old_params = params
    #   flash[:alert] = "Error: #{@job.errors.full_messages.to_sentence}"
    #   render 'new'
    # end
  end

  def new #done through UJS now
    @boat = Boat.find(params[:boat_id])

    respond_to do |format|
      @job = @boat.jobs.new
      format.js
    end
    # if params[:boat_id].present?
    #   @boat = Boat.find(params[:boat_id]) 
    #   @job = @boat.jobs.new
    # else
    #   @job = Job.new
    # end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def job_params
    params.require(:job).permit(:origin, :destination, :number_of_containers, :cost, :name, :description)
  end
end
