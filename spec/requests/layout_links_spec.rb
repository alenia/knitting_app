require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    visit('/')
    page.has_selector?('title', :content => "Home")
  end
  it "should have a Contact page at '/contact'" do
    visit('/contact')
    page.should have_content('title', :content => "Contact")
  end
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  it "should have a help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  it "should have a project page at '/projects'" do
    get '/projects'
    response.should have_selector('title', :content => "Projects")
  end
  it "should have a new project page at '/projects/new'" do
    get '/projects/new'
    response.should have_selector('title', :content => "New Project")
  end
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end
  it "should have the right links on the project page" do
    visit projects_path
    click_button "New Project"
    response.should have_selector('title', :content => "New Project")
  end
end
