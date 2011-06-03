require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    visit('/')
    page.should have_selector('title', :content => "Home")
  end
  it "should have a Contact page at '/contact'" do
    visit('/contact')
    page.should have_selector('title', :content => "Contact")
  end
  it "should have an About page at '/about'" do
    visit('/about')
    page.should have_selector('title', :content => "About")
  end
  it "should have a help page at '/help'" do
    visit('/help')
    page.should have_selector('title', :content => "Help")
  end
  it "should have a signup page at '/signup'" do
    visit('/signup')
    page.should have_selector('title', :content => "Sign up")
  end
  it "should have a project page at '/projects'" do
    visit('/projects')
    page.should have_selector('title', :content => "Projects")
  end
  it "should have a new project page at '/projects/new'" do
    visit('/projects/new')
    page.should have_selector('title', :content => "New Project")
  end
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector('title', :content => "About")
    click_link "Help"
    page.should have_selector('title', :content => "Help")
    click_link "Home"
    page.should have_selector('title', :content => "Home")
    click_link "Sign up now!"
    page.should have_selector('title', :content => "Sign up")
  end
  it "should have the right links on the project page" do
    visit projects_path
    click_button "New Project"
    page.should have_selector('title', :content => "New Project")
  end
end
