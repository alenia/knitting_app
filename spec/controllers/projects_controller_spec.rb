require 'spec_helper'

describe ProjectsController do
  render_views
  describe "new" do
    it "should show the new page for a new project" do
      get 'new'
      response.body.should include "New"
    end
  end
  describe "index" do
    it "should show the projects index" do
      get 'index'
      response.should be_success
    end
    it "should display projects" do
      project = Project.create(:name => "Aidez", :current_row => 42)
      get :index
      assigns[:projects].first.should == project
      response.body.should include "Aidez"
    end
  end
  describe "create" do
    it "should create a new project when user pushes the create button" do
      Project.where(:name => "Aidez", :current_row => 42).count.should == 0
      post :create, :project => {:name => "Aidez", :current_row => 42}
      Project.where(:name => "Aidez", :current_row => 42).count.should == 1
    end
    it "should not create a project if the name is blank" do
      post :create, :project => {:name => nil, :current_row => 42}
      post :create, :project => {:name => "   ", :current_row => 42}
      Project.count.should == 0
    end
    it "should only create projects if the current_row is an integer" do
      post :create, :project => {:name => "Name", :current_row => 3.14159}
      post :create, :project => {:name => "Frank", :current_row => "hello"}
      Project.count.should == 0
    end
    it "should only create projects if the current_row is greater than zero" do
      post :create, :project => {:name => "Name", :current_row => -4}
      Project.count.should == 0
    end
  end
  describe "show" do
    before do
      @project = Project.create(:name => "Aidez", :current_row => 42)
    end
    it "should display the project page for a project" do
      get :show, id: @project
      response.should be_success
    end
    it "should display the project name" do
      get :show, id: @project
      response.body.should include "Aidez"
    end
  end
  describe "update" do
    it "should increment when you want it to" do
      project = Project.create(:name => "Aidez", :current_row => 42)
      Project.where(:name => "Aidez", :current_row => 42).count.should == 1
      Project.where(:name => "Aidez", :current_row => 43).count.should == 0
      post :update, :project => {:current_row => (project.current_row + 1) }, id: project
      Project.where(:name => "Aidez", :current_row => 42).count.should == 0
      Project.where(:name => "Aidez", :current_row => 43).count.should == 1
    end
    it "should be able to edit a project's name" do
      project = Project.create(:name => "Nombre", :current_row => 0)
      Project.where(:name => "Nom").count.should == 0
      post :update, :project => {:name => "Nom"}, id: project
      Project.where(:name => "Nom").count.should == 1
    end
  end
  describe "edit" do
    before do
      @project = Project.create(:name => "Nombre", :current_row => 0)
    end
    it "should show the edit page to edit a project" do
      get :edit, id: @project
      response.body.should include "Update"
      response.body.should include "Nombre"
    end
  end
  describe "destroy" do
    it "projects can be deleted" do
      project = Project.create(:name => "Aidez", :current_row => 42)
      delete :destroy, :id => project.id
      Project.find_by_id(project.id).should be_nil
    end
  end
end
