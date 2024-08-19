class MaterialsController < ApplicationController
  before_action :set_project
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def index
    @materials = @project.materials
  end

  def show
  end

  def new
    @material = @project.materials.build
  end

  def create
    @material = @project.materials.build(material_params)
    if @material.save
      redirect_to project_material_path(@project, @material), notice: 'Material was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @material.update(material_params)
      redirect_to project_material_path(@project, @material), notice: 'Material was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @material.destroy
    redirect_to project_materials_path(@project), notice: 'Material was successfully destroyed.'
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_material
    @material = @project.materials.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:name, :store, :estimated_value, :paid_value)
  end
end