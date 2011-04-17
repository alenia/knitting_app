require 'spec_helper'

describe ProjectsController do
  render_views
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "New Project")
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
end
