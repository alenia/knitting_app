require 'spec_helper'

describe "projects" do
  it "can create, update, and delete a project" do
    visit projects_path
    click_button "New Project"
    fill_in "project[name]", :with => "Sneed"
    fill_in "project[current_row]", :with => 42
    click_button "Create!"
    page.should have_content "Your Project was Created!"
    page.should have_content "Project page for Sneed"
    page.should have_content "42"
    click_link "+"
    page.should have_content "43"
    page.should_not have_content "42"
    click_link "-"
    page.should have_content "42"
    click_button "Back"
    page.should have_content "Projects"
    click_link "Sneed"
    page.should have_content "Project page for Sneed"
    click_button "Delete"
    page.should have_content "Projects"
    page.should_not have_content "Sneed"
  end
  it "should throw correct message if project name or row is invalid" do
    visit projects_path
    click_button "New Project"
    fill_in "project[name]", :with => "     "
    fill_in "project[current_row]", :with => 42
    click_button "Create!"
    page.should have_content "Post Failed!"
    page.should have_content "Name can't be blank."
    
  end
end