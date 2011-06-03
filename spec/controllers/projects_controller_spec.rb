require 'spec_helper'

describe ProjectsController do
  render_views
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  describe "index" do
    it "should get index" do
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
  end
  describe "destroy" do
    it "projects can be deleted" do
      project = Project.create(:name => "Aidez", :current_row => 42)
      delete :destroy, :id => project.id
      Project.find_by_id(project.id).should be_nil
    end
  end
end
