class WorkersController < ApplicationController
  before_action :set_project
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
    @workers = @project.workers
  end

  def show
  end

  def new
    @worker = @project.workers.build
  end

  def create
    @worker = @project.workers.build(worker_params)
    if @worker.save
      redirect_to project_worker_path(@project, @worker), notice: 'Worker was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @worker.update(worker_params)
      redirect_to project_worker_path(@project, @worker), notice: 'Worker was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @worker.destroy
    redirect_to project_workers_path(@project), notice: 'Worker was successfully destroyed.'
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_worker
    @worker = @project.workers.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:name, :position, :phone_number, :estimated_labor_value, :paid_value, :construction_material_value, :worked_hours)
  end
end