class ProjectsController < ApplicationController
  def create
    Project.create! params[:project]
    redirect_to projects_path
  end
  
  def new
    @title = "New Project"
  end
  
  def show
    @project = Project.find(params[:id])
    @title = @project.name
  end
  
  def index
    @title = "Projects"
    @projects = Project.all
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to project_path
  end
end
