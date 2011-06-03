class ProjectsController < ApplicationController
  def create
    project = Project.create! params[:project]
    flash[:notice] = "Your Project was Created!"
    redirect_to project_path(project)
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
    redirect_to project_path(@project)
  end
  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end
end
