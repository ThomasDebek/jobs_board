class JobsController < ApplicationController

  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end


  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
    if @job.save
      redirect_to @job
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @job.update_attributes(jobs_params)
      redirect_to @job
    else
      render action: 'Edit'
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end


  private

  def jobs_params
    params.require(:job).permit(:title, :description, :company, :url)
  end

  def set_job
    @job = Job.find(params[:id])
  end


end





