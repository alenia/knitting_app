class ProjectsController < ApplicationController
  def create
    project = Project.create params[:project]
    if project.save
      flash[:notice] = "Your Project was Created!"
      redirect_to project_path(project)
    else
      error_string = project.errors.map do |field, error|
        field.to_s.gsub('_',' ').capitalize + ' ' + error + '.'
      end.join('<br/>')
      flash[:error] = "Post Failed! <br/> #{error_string}".html_safe
      redirect_to new_project_path
    end
  end
  
  def new
    @title = "New Project"
  end
  
  def show
    @project = Project.find(params[:id])
    @title = @project.name
  end
  
  def edit
    @project = Project.find(params[:id])
    @title = "Edit #{@project.name}"
  end
  
  def index
    @title = "Projects"
    @projects = Project.all
  end
  
  def update
    @project = Project.find(params[:id])
    test = @project.update_attributes(params[:project])
    flash[:error] = "Current row can't drop below zero" unless test
    redirect_to project_path(@project)
  end
  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end
end
