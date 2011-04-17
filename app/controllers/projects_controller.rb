class ProjectsController < ApplicationController
  def create
    Project.create! params[:project]
    redirect_to projects_path
  end
  
  def new
    @title = "New Project"
  end
  
  def index
    @title = "Projects"
    @projects = Project.all
  end
  
end
